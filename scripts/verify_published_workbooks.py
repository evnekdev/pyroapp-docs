#!/usr/bin/env python3
"""Validate that published tutorial workbooks are committed Excel containers.

GitHub Pages treats the committed Excel-finalized XLSX files as immutable
teaching artifacts.  This verifier intentionally uses only the Python standard
library so that Linux documentation CI cannot regenerate or normalize them.
"""

from __future__ import annotations

import argparse
import hashlib
import sys
import zipfile
from pathlib import Path

EXPECTED_WORKBOOKS = (
    "01_PyroApp_Getting_Started_Ca-Zn-O.xlsx",
    "02_PyroApp_DAT_Inspection_and_Editing_Ca-Zn-O.xlsx",
    "03_PyroApp_Optimization_Workflows.xlsx",
)
REQUIRED_ZIP_MEMBERS = {"[Content_Types].xml", "xl/workbook.xml"}


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(block)
    return digest.hexdigest()


def validate_xlsx(path: Path) -> str:
    if not path.is_file():
        raise ValueError(f"missing workbook: {path}")
    if not zipfile.is_zipfile(path):
        raise ValueError(f"not an XLSX ZIP container: {path}")
    with zipfile.ZipFile(path) as archive:
        corrupt_member = archive.testzip()
        if corrupt_member is not None:
            raise ValueError(f"corrupt XLSX member {corrupt_member!r}: {path}")
        missing = REQUIRED_ZIP_MEMBERS - set(archive.namelist())
        if missing:
            raise ValueError(f"missing XLSX members {sorted(missing)}: {path}")
    return sha256(path)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--source", required=True, type=Path, help="committed workbook directory")
    parser.add_argument("--published", type=Path, help="MkDocs site workbook directory to compare")
    args = parser.parse_args()

    failures: list[str] = []
    for name in EXPECTED_WORKBOOKS:
        source = args.source / name
        try:
            source_hash = validate_xlsx(source)
        except ValueError as error:
            failures.append(str(error))
            continue
        print(f"source {name} sha256={source_hash}")
        if args.published is None:
            continue
        published = args.published / name
        try:
            published_hash = validate_xlsx(published)
        except ValueError as error:
            failures.append(str(error))
            continue
        print(f"published {name} sha256={published_hash}")
        if source_hash != published_hash:
            failures.append(
                f"published workbook differs from committed artifact: {name} "
                f"source={source_hash} published={published_hash}"
            )

    if failures:
        for failure in failures:
            print(f"ERROR: {failure}", file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())