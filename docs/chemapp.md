# CHEMAPP

GTT-Technologies distributes ChemApp as a compiled code library which is available for different platforms (Windows, Linux, etc), but since PyroApp is dependent on Desktop Windows Excel distribution, we are going to consider only ChemApp distributions compiled for Windows.

## ChemApp DLLs, static vs dynamic loading

Broadly speaking, on Windows, executable code can be either in form of EXE files or DLL files. An *executable* (exe files) has an *entry point* and can be executed directly in terminal or by double-clicking on it. To reduce EXE file bloating and enhance code reuse, some of the programs or code parts can be distributed in form of DLLs (Dynamically Loaded Libraries). These share similar internal structure with EXE, but lack an entry point. Therefore, they cannot be executed directly. To make the code inside of a DLL work, you need to load it inside an existing EXE or another DLL.

On modern operating systems, there are two ways to load a dynamic library:

  - Static (the path to the library is "baked" into the EXE and cannot be changed, the DLL is loaded whenever the parent EXE is loaded).
  
  - Dynamic (the hosting EXE does not know about the DLL at the compilation time and only loads it when the code execution leads to a call to LoadLibrary function of Windows SDK).
  
## Advantages of dynamic loading

All examples of ChemApp use at [GTT-Technologies ChemApp documentation](https://gtt-technologies.de/software/chemapp/online-manual/) imply that ChemApp is loaded into a compiled binary using *static* loading. This is why, for example, C/C++ development with ChemApp requires cacint.h and chemapp_name.lib files - cacint.h declares the function signatures and chemapp_name.lib contains compiled ChemApp function stubs which tell the compiler how to locate the chemapp_name.dll file.

However, the author found that if ChemApp is loaded *dynamically*, skipping the linking process and passing the path to chemapp_name.dll as a function argument, it offers more flexibility in program execution and opens up a way to easy parallelization of ChemApp calculation when several instances of ChemApp are loaded.

## Independent instances of a DLL during dynamic loading

[TODO]