# Convenience function to set build standards
macro(setBuildChainSpecifications CompilerChain LanguageStandard)

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
    set(CMAKE_BUILD_TYPE RELEASE)
  elseif("${BuildType_alllowerCase}" STREQUAL "debug")
    set(CMAKE_BUILD_TYPE "Debug")
  else()
    set(CMAKE_BUILD_TYPE "Release")
  endif()

  set(
    CMAKE_CXX_FLAGS_GENERAL
    "-Werror=comment -Werror=reorder -Wno-error=deprecated-declarations -Wall -Wextra -Werror -Wsequence-point -Werror=unused-variable"
    )
  set(CMAKE_CXX_FLAGS_RELEASE
      "${CMAKE_CXX_FLAGS_RELEASE} ${CMAKE_CXX_FLAGS_GENERAL} -O3")


  if("${CompilerChain_alllowerCase}" STREQUAL "gcc")
    set(CMAKE_CXX_COMPILER g++ FORCE)
    set(CXX_STANDARD_REQUIRED true FORCE)
    set(CMAKE_CXX_EXTENSIONS off FORCE)
    set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} ${CMAKE_CXX_FLAGS_GENERAL} -O0 -g3 -pg -ggdb")
    

  elseif("${CompilerChain_alllowerCase}" STREQUAL "llvm" OR "${CompilerChain_alllowerCase}" STREQUAL "clang")
    set(CMAKE_CXX_COMPILER clang++ FORCE)
    set(CXX_STANDARD_REQUIRED true FORCE)
    set(CMAKE_CXX_EXTENSIONS off FORCE)
    set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} ${CMAKE_CXX_FLAGS_GENERAL}  -O0 -g3 -pg -ggdb -Wunused-private-field")


  elseif("${CompilerChain_alllowerCase}" STREQUAL "mingw")
    set(CMAKE_CXX_COMPILER g++ FORCE)
    set(CXX_STANDARD_REQUIRED true FORCE)
    set(CMAKE_CXX_EXTENSIONS off FORCE)
    set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} ${CMAKE_CXX_FLAGS_GENERAL}  -O0 -g3 -pg -ggdb ")


  elseif("${CompilerChain_alllowerCase}" STREQUAL "msvc")
    set(CXX_STANDARD_REQUIRED true FORCE)
    set(CMAKE_CXX_EXTENSIONS off FORCE)
    set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} /MTd")

  endif()

endmacro(setBuildChainSpecifications)
