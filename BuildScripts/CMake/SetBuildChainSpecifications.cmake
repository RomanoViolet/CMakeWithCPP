# Convenience function to set build standards
function(setBuildChainSpecifications CompilerChain LanguageStandard)

  # Set the received arguments into variables
  set(CompilerChain "${ARGV1}")
  set(LanguageStandard "${ARGV3}")
  set(BuildType "${ARGV5}")

  # Make the build type global so that other functions can also use it.
  string(TOLOWER ${BuildType} BuildType_alllowerCase)

  # Make the compiler type global so that other functions can also use it.
  string(TOLOWER ${CompilerChain} CompilerChain_alllowerCase)

  # Make the requested build type a global
  set(BuildType "${BuildType_alllowerCase}" CACHE FORCE "BuildType")

  if("${BuildType_alllowerCase}" STREQUAL "release")
    set(CMAKE_BUILD_TYPE "RELEASE")
  elseif("${BuildType_alllowerCase}" STREQUAL "debug")
    set(CMAKE_BUILD_TYPE "DEBUG")
  else()
    set(CMAKE_BUILD_TYPE "RELEASE")
  endif()

  # The name of the project
  project(vmc_core VERSION 0.1 LANGUAGES C CXX)

  # General flags
  set(CMAKE_CXX_STANDARD ${LanguageStandard} FORCE)
  set(CXX_STANDARD_REQUIRED true FORCE)
  set(CMAKE_CXX_EXTENSIONS off FORCE)

  message(
    "Tool Settings: ${LanguageStandard}, ${CompilerChain_alllowerCase}, ${CompilerChain}"
    )

  set(
    CMAKE_CXX_FLAGS_GENERAL
    "-Werror=comment -Werror=reorder -Wno-error=deprecated-declarations -Wall -Wextra -Werror -Wsequence-point -Werror=unused-variable"
    )
  set(
    CMAKE_C_FLAGS_GENERAL
    "-Werror=comment -Werror=reorder -Wno-error=deprecated-declarations -Wsequence-point -Werror=unused-variable"
    )

  set(CMAKE_CXX_FLAGS_RELEASE
      "${CMAKE_CXX_FLAGS_RELEASE} ${CMAKE_CXX_FLAGS_GENERAL} -O3")
  set(CMAKE_C_FLAGS_RELEASE
      "${CMAKE_C_FLAGS_RELEASE} ${CMAKE_C_FLAGS_GENERAL} -O3")

  if("${CompilerChain_alllowerCase}" STREQUAL "gcc")
    message("Compiler selection: GCC")
    set(CMAKE_CXX_COMPILER g++ FORCE)
    set(CMAKE_CXX_FLAGS_DEBUG
        "${CMAKE_CXX_FLAGS_DEBUG} ${CMAKE_CXX_FLAGS_GENERAL} -O0 -g3 -pg -ggdb")
    set(CMAKE_C_FLAGS_DEBUG
        "${CMAKE_C_FLAGS_DEBUG} ${CMAKE_C_FLAGS_GENERAL} -O0 -g3 -pg -ggdb")

  elseif("${CompilerChain_alllowerCase}" STREQUAL "llvm"
         OR "${CompilerChain_alllowerCase}" STREQUAL "clang")
    message("Compiler selection: LLVM")
    set(CMAKE_CXX_COMPILER clang++ FORCE)
    set(
      CMAKE_CXX_FLAGS_DEBUG
      "${CMAKE_CXX_FLAGS_DEBUG} ${CMAKE_CXX_FLAGS_GENERAL}  -O0 -g3 -pg -ggdb -Wunused-private-field"
      )
    set(CMAKE_C_FLAGS_DEBUG
        "${CMAKE_C_FLAGS_DEBUG} ${CMAKE_C_FLAGS_GENERAL} -O0 -g3 -pg -ggdb")

  elseif("${CompilerChain_alllowerCase}" STREQUAL "mingw")
    message("Compiler selection: MINGW")
    set(CMAKE_CXX_COMPILER g++ FORCE)
    set(
      CMAKE_CXX_FLAGS_DEBUG
      "${CMAKE_CXX_FLAGS_DEBUG} ${CMAKE_CXX_FLAGS_GENERAL}  -O0 -g3 -pg -ggdb ")
    set(CMAKE_C_FLAGS_DEBUG
        "${CMAKE_C_FLAGS_DEBUG} ${CMAKE_C_FLAGS_GENERAL} -O0 -g3 -pg -ggdb")

  elseif("${CompilerChain_alllowerCase}" STREQUAL "msvc")
    message("Compiler selection: MSVC" FORCE)
    set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} /MTd")
    set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} /MTd")

  endif()

endfunction(setBuildChainSpecifications)
