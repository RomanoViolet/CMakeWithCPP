cmake_minimum_required(VERSION 3.10)

# Verbosity
set(CMAKE_VERBOSE_MAKEFILE ON)
set(CMAKE_RULE_MESSAGES ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
# General flags
set(CMAKE_CXX_STANDARD 11)
# set( CMAKE_CXX_COMPILER /usr/bin/clang++ )
set(CXX_STANDARD_REQUIRED true)
set(CMAKE_CXX_EXTENSIONS off)
set(CMAKE_BUILD_TYPE "RELEASE")

# The name of the project
project(DemoApplication VERSION 0.1 LANGUAGES CXX)

# Include CMake standard libaries
# include(${CMAKE_ROOT}/Modules/ExternalProject.cmake)
include(ExternalProject)

# Setting build chain preferences
include(
  ${CMAKE_CURRENT_SOURCE_DIR}/BuildScripts/CMake/SetBuildChainSpecifications.cmake
  )

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
include(
${CMAKE_CURRENT_SOURCE_DIR}/BuildScripts/CMake/ProvideLegacyDependency.cmake)

# Function to build DemoApplication as a library. Not everything is linked yet.
include(${CMAKE_CURRENT_SOURCE_DIR}/BuildScripts/CMake/BuildDemoLibrary.cmake)

# Convenience functions for installing DemoApplication locally
include(${CMAKE_CURRENT_SOURCE_DIR}/BuildScripts/CMake/InstallDemoApplicationLocally.cmake)

# Exporting DemoApplication library so that 'find_package' will work
include(${CMAKE_CURRENT_SOURCE_DIR}/BuildScripts/CMake/ExportDemoApplication.cmake)

# All DemoApplication Internal tests, e.g., Google Tests
include(
  ${CMAKE_CURRENT_SOURCE_DIR}/BuildScripts/CMake/BuildAndRunAllDemoApplicationTests.cmake)

# Ensure that all tools and versions are compliant. Minimum acceptable versions
# are speciied as key-value pairs Currently, only minimum git version is
# required
ensuretoolcompliance(Git 2.15)

# Supply arguments as key-value pairs CompilerChain: gcc | llvm | msvc | mingw
# LanguageStandard: 11 | 14 | 17 BuildType: Debug | Release
setbuildchainspecifications(CompilerChain
                            "gcc"
                            LanguageStandard
                            17
                            BuildType
                            "Release")

# Set Global variables such as the commit-hash of the FancySquareRoot library that must be used.
setglobalvariables(FancySquareRoot_Commit_Hash
                   "4cd14a67709ce89f2b04b150db615dfe5bd345bf"
                   Location_of_GoogleTests
                   "${PROJECT_SOURCE_DIR}/gtest")

# Get FancySquareRoot library which is required for building the
# DemoApplication. This library is sourced from another repository.
getfancysquareroot()


# Debug step
add_custom_target(
                    DebugTarget
                    Depends FancySquareRoot
                    COMMENT "Check whether the custom square root download and build worked"
                  )

# Provides the legacy-dependency required for the DemoApplication. See the comment on legacy-dependency above.
#ProvideLegacyDependency()

# Build DemoApplication as a library, but is not yet linked to external dependencies, as FancySquareRoot library
#buildDemoApplicationlibrary()

# Install VMC into a local prefix so that it can be offered for "find_package"
#installvmclocally(Location "${PROJECT_SOURCE_DIR}/build/DemoApplicationHeaders")

# Make VMC available to customers
#exportDemoApplication()

# ------------------Testing-----------------
# Build and Run all Google Tests
#buildandrunallDemoApplicationtests()
