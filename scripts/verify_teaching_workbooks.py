#!/usr/bin/env python3
"""Validate the three committed PyroApp teaching workbooks without Excel.

This runs in Linux Pages CI after a Windows maintainer has generated and
Excel-finalized the downloadable XLSX artifacts.  It deliberately validates
rather than regenerates them.
"""
from __future__ import annotations

import argparse
import sys
import zipfile
from pathlib import Path
from xml.etree import ElementTree as ET

NS = {"m": "http://schemas.openxmlformats.org/spreadsheetml/2006/main", "r": "http://schemas.openxmlformats.org/officeDocument/2006/relationships", "p": "http://schemas.openxmlformats.org/package/2006/relationships"}
EXPECTED = {
    "01_PyroApp_Getting_Started_Ca-Zn-O.xlsx": {},
    "02_PyroApp_DAT_Inspection_and_Editing_Ca-Zn-O.xlsx": {
        ("Safe edit", "B14"): "0",
        ("Safe edit", "B16"): "IF($B$14,XLL_CA_SET_INTERACTION_PARAMETERS_G(Start!$B$10,$B$8,$B$9,$B$12,$B$10,$B$13),\"Disabled\")",
    },
    "03_PyroApp_Optimization_Workflows.xlsx": {
        ("Parameters", "B8"): "-26652.08",
        ("Parameters", "B9"): "0",
        ("Parameters", "B15"): "0",
        ("Parameters", "B5"): "XLL_CA_LIST_INTERACTIONS_G(Start!$B$10,$B$4)",
        ("Parameters", "B20"): "IF($B$15,XLL_CA_SET_INTERACTION_PARAMETERS_G(Start!$B$10,$B$4,$B$5,$B$8,1,$B$12),\"Disabled\")",
        ("Parameters", "B21"): "IF($B$15,XLL_CA_SET_INTERACTION_PARAMETERS_G(Start!$B$10,$B$4,$B$5,$B$9,2,$B$12),\"Disabled\")",
    },
}


def sheet_parts(archive: zipfile.ZipFile) -> dict[str, str]:
    workbook = ET.fromstring(archive.read("xl/workbook.xml"))
    rels = ET.fromstring(archive.read("xl/_rels/workbook.xml.rels"))
    targets = {rel.attrib["Id"]: rel.attrib["Target"].lstrip("/") for rel in rels}
    result = {}
    for sheet in workbook.findall("m:sheets/m:sheet", NS):
        target = targets[sheet.attrib["{http://schemas.openxmlformats.org/officeDocument/2006/relationships}id"]]
        result[sheet.attrib["name"]] = "xl/" + target if not target.startswith("xl/") else target
    return result


def cells(archive: zipfile.ZipFile, part: str) -> dict[str, tuple[str | None, str | None]]:
    root = ET.fromstring(archive.read(part))
    result = {}
    for cell in root.findall(".//m:c", NS):
        formula = cell.findtext("m:f", namespaces=NS)
        value = cell.findtext("m:v", namespaces=NS)
        result[cell.attrib["r"]] = (formula, value)
    return result


def verify_one(path: Path) -> list[str]:
    errors: list[str] = []
    try:
        with zipfile.ZipFile(path) as archive:
            bad = archive.testzip()
            if bad:
                return [f"{path.name}: corrupt ZIP member {bad}"]
            names = set(archive.namelist())
            for required in ("[Content_Types].xml", "xl/workbook.xml"):
                if required not in names:
                    errors.append(f"{path.name}: missing {required}")
            sheets = sheet_parts(archive)
            workbook_cells = {name: cells(archive, part) for name, part in sheets.items()}
            for sheet, addresses in workbook_cells.items():
                for address, (formula, _) in addresses.items():
                    if formula == '\"\"':
                        errors.append(f"{path.name} {sheet}!{address}: forbidden formula header =\"\"")
                    if formula and "XLL_CA_SET_" in formula and not formula.startswith("IF($B$"):
                        errors.append(f"{path.name} {sheet}!{address}: SET must be guarded by a false write gate")
            for (sheet, address), expected in EXPECTED[path.name].items():
                actual_formula, actual_value = workbook_cells.get(sheet, {}).get(address, (None, None))
                actual = actual_formula.replace("_xll.", "") if actual_formula is not None else actual_value
                if address == "B8" and actual_value is not None and abs(float(actual_value) - float(expected)) < 1e-8:
                    continue
                if actual != expected:
                    errors.append(f"{path.name} {sheet}!{address}: expected {expected!r}, got {actual!r}")
    except (OSError, KeyError, ET.ParseError, zipfile.BadZipFile) as exc:
        errors.append(f"{path.name}: unreadable XLSX: {exc}")
    return errors


def verify(directory: Path) -> int:
    names = {path.name for path in directory.glob("*.xlsx")}
    expected = set(EXPECTED)
    errors = [f"unexpected workbook set: expected {sorted(expected)}, got {sorted(names)}"] if names != expected else []
    for name in sorted(expected):
        path = directory / name
        if not path.is_file():
            errors.append(f"missing workbook: {path}")
        else:
            errors.extend(verify_one(path))
    if errors:
        print("\n".join(errors), file=sys.stderr)
        return 1
    print(f"Validated {len(expected)} immutable teaching workbooks in {directory}")
    return 0


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--source", type=Path, default=Path("docs/tutorial-assets/workbooks"))
    raise SystemExit(verify(parser.parse_args().source))