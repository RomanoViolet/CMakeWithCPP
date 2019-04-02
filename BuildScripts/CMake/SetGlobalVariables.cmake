function(setGlobalVariables)

  # The base path
  #set(DemoApplication ${PROJECT_SOURCE_DIR} CACHE FORCE "DemoApplication")

  # Location of the source directory providing legacy dependencies which are built together with the DemoApplication.
  set(LEGACY_DIR "${PROJECT_SOURCE_DIR}/LegacyDependency"
      CACHE
      FORCE "LEGACY_DIR")

  # During build, the legacy sources will live at ${PATH_TO_COPY_LEGACY_SOURCES}
  set(  PATH_TO_COPY_LEGACY_SOURCES "${CMAKE_CURRENT_BINARY_DIR}/ThirdPartySources"
        CACHE
        FORCE "PATH_TO_COPY_LEGACY_SOURCES")

  # Location of Fancy Square Root directory where the sources and library will
  # be built
  set(FANCYSQUAREROOT_DIR "${PROJECT_SOURCE_DIR}/../FancySquareRoot"
      CACHE
      FORCE "FANCYSQUAREROOT_DIR")

  # The location where the FancySquareRoot dependency is downloaded can be modified as necessary. See GetFancySquareRoot.cmake
  set(FANCYSQUAREROOT_HEADER_DIR "${CMAKE_CURRENT_BINARY_DIR}/Downloads/FancySquareRoot/src/FancySquareRoot/inc"
      CACHE
      FORCE "FANCYSQUAREROOT_HEADER_DIR")

  # The location where FancySquareRoot library is available
  set(FANCYSQUAREROOT_LIBRARY_PATH "${CMAKE_CURRENT_BINARY_DIR}/Downloads/FancySquareRoot/src/FancySquareRoot-build"
      CACHE
      FORCE "FANCYSQUAREROOT_LIBRARY_PATH")


  # Git hash to be used for building the FancySquareRoot library.
  # This allows for choosing a specific commit of the FancySquareRoot repository for building the FancySquareRoot dependency.
  set(FancySquareRoot_Commit_Hash "${ARGV1}"
      CACHE
      FORCE "FancySquareRoot_Commit_Hash")

  # Store the location of Google Test folder
  set(  LocationOfGoogleTests "${ARGV3}"
        CACHE
        FORCE "LocationOfGoogleTests")

  # The name of the built FancySquareRoot library
  set(DADDY_LIB "FancySquareRoot" CACHE FORCE "FancySquareRoot")

endfunction(setGlobalVariables)
