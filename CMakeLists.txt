#https://foonathan.net/blog/2016/03/03/cmake-install.html
# Setting build chain preferences
include(
  ${CMAKE_CURRENT_SOURCE_DIR}/BuildScripts/CMake/SetBuildChainSpecifications.cmake
  )

cmake_minimum_required(VERSION 3.10)

# Supply arguments as key-value pairs CompilerChain: gcc | llvm | msvc | mingw
# LanguageStandard: 11 | 14 | 17 BuildType: Debug | Release
setbuildchainspecifications(CompilerChain
                            "gcc"
                            LanguageStandard
                            11
                            BuildType
                            "Debug")

# The name of the project
project(DemoApplication VERSION 0.1 LANGUAGES CXX)



# Tool Compliance
include(${CMAKE_CURRENT_SOURCE_DIR}/BuildScripts/CMake/ToolCompliance.cmake)

# For setting global variables, such as required directories
include(${CMAKE_CURRENT_SOURCE_DIR}/BuildScripts/CMake/SetGlobalVariables.cmake)

# For making available the FancySquareRoot library required for building the complete application
include(${CMAKE_CURRENT_SOURCE_DIR}/BuildScripts/CMake/GetFancySquareRoot.cmake)

# Provide Legacy dependency
# This function will provide dependency which do not live in their own repository, or are hosted in a slow repository, and is not managed by this one.
# Typical use-cases: The repository holding the dependency is too slow, or only a small part of a big repository is needed, making cloning very expensive.
# Or, the dependency is not hosted in any git-like repository, but some proprietary internal storage.
# Therefore, the owner of this project decides to hard-copy necessary parts in this repository.
# The copy must be updated regularly.
# Additionally. it is assumed that the LegacyDependency is written in C-99 language standard.
include(
${CMAKE_CURRENT_SOURCE_DIR}/BuildScripts/CMake/ProvideLegacyDependency.cmake)

# Function to build DemoApplication as a library. Not everything is linked yet.
include(${CMAKE_CURRENT_SOURCE_DIR}/BuildScripts/CMake/BuildDemoLibrary.cmake)

# Convenience functions for installing DemoApplication locally
include(${CMAKE_CURRENT_SOURCE_DIR}/BuildScripts/CMake/InstallDemoApplicationLocally.cmake)

# All DemoApplication Internal tests, e.g., Google Tests
include(
  ${CMAKE_CURRENT_SOURCE_DIR}/BuildScripts/CMake/BuildAndRunAllGoogleTests.cmake)

# Ensure that all tools and versions are compliant. Minimum acceptable versions
# are speciied as key-value pairs Currently, only minimum git version is
# required
ensuretoolcompliance(Git 2.15)



# Set Global variables such as the commit-hash of the FancySquareRoot library that must be used.
setglobalvariables(FancySquareRoot_Commit_Hash
                   "4cd14a67709ce89f2b04b150db615dfe5bd345bf"
                   Location_of_GoogleTests
                   "${PROJECT_SOURCE_DIR}/GoogleTests")



# Get FancySquareRoot library which is required for building the
# DemoApplication. This library is sourced from another repository.
getfancysquareroot()

# Provides the legacy-dependency required for the DemoApplication. See the comment on legacy-dependency above.
# It is assumed that the dependency is part of this repository. See notes the legacy dependency above.
# Essentially, the function demonstrates a between ExternalProject and native (owned by this project) source code.
# The dependency is stored in a folder "LegacyDependency" but it must be moved to a  different location as expected by the
# existing source code. In this example, the "LegacyDependency" will be moved to a (created-at-buildtime) folder "${PROJECT_SOURCE_DIR}/ThirdPartySources/"
# It is assumed that the LegacyDependency is not "CMake-friendly", i.e., does not contain any CMakeLists.txt file.
ProvideLegacyDependency()

# Build DemoApplication as a library, but is not yet linked to external dependencies, as FancySquareRoot library
buildDemoLibrary()

# Install the built package locally in order to support find_package
InstallDemoLibrary( Location "${PROJECT_SOURCE_DIR}/build/DemoLibrary"
                    VERSION_MAJOR 0 # The version of the library is set to VERSION_MAJOR.VERSION_MINOR
                    VERSION_MINOR 9
                )

# Debug step

#add_custom_target(
#                    DummyTarget
#                    DEPENDS CopyLegacyDependency
#                    COMMENT "Check whether the custom square root download and build worked"
#                  )
# ------------------Testing-----------------
# Build and Run all Google Tests
BuildAndRunAllGoogleTests()
