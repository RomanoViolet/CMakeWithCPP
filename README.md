<center>
<h1>CMake Project with C++ Sources</h1>
</center>

## What This Project is About
This project demonstrates a CMake-based build system for a `C++`-based application. Of course, the current project offers a lot of room for improvement.

The project structure mimics a typical project in a medium- to large organization. Specifically:
1. This project has some external dependencies with other modern projects (specifically, the `FancySquareRoot` project providing `CMakeLists.txt` file)
2. The project has depends on legacy projects (specifically, the `LegacyDependency` project which _does not_ provide a `CMakeLists.txt` file)
3. Unit tests for the project supplied in the folder `GoogleTests`

## Updates
| Date | Note |
| :---         |     :---:      |
|23 November 2019         |     Updated CMake to automatically install Google Tests if the host does not have it installed already.     |

## Structure of the CMake Project
The main 'CMakeLists.txt' is written to be modular, invoking function defined in `BuildScripts/CMake`. Specifically, the following functions are provided and used in the 'CMakeLists.txt':
1. **ToolCompliance.cmake**:  Ensure required tools (in this project, `git` version 2.15 or higher) is available. Called on line 55 of `CMakeLists.txt`:

```
ensuretoolcompliance(Git 2.15)
```

2. **SetGlobalVariables.cmake**: Provides convenience to declare and store variables required during the build, e.g., the specific commit of one dependency `LegacyDependency`, in line 60:


```
setglobalvariables(FancySquareRoot_Commit_Hash
                   "4cd14a67709ce89f2b04b150db615dfe5bd345bf"
                   Location_of_GoogleTests
                   "${PROJECT_SOURCE_DIR}/GoogleTests")
```

3. **GetFancySquareRoot.cmake**: The function implements the partial build to clone the external dependency `LegacyDependency` provided by an external project, see line 67:

```
getfancysquareroot()
```

4. **ProvideLegacyDependency.cmake**: Implements the partial build required to build the legacy dependency of the project on line 75:

```
ProvideLegacyDependency()
```

5. **BuildDemoLibrary.cmake**: Implements the function to build this project, combining all dependencies, i.e., `LegacyDependency` and the `FancySquareRoot` on line 78:

```
buildDemoLibrary()
```

6. **InstallDemoApplicationLocally.cmake**: Implements functions required to export dependencies of this project so that a customer project may integrate this project by calling `ExternalProject`.

_Note_: This function has not yet been completely implemented.


```
InstallDemoLibrary( Location "${PROJECT_SOURCE_DIR}/build/DemoLibrary"
                    VERSION_MAJOR 0 # The version of the library is set to VERSION_MAJOR.VERSION_MINOR
                    VERSION_MINOR 9
                )
```


In collaboration with Mario, together we learnt a lot. Find Mario at https://github.com/MarioMarquezLuciano
