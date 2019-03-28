function(setGlobalVariables)

  # The base path
  set(DemoApplication ${PROJECT_SOURCE_DIR} CACHE FORCE "DemoApplication")
  # message("Set basePathToVmc: ${PROJECT_SOURCE_DIR}")

  # Location of the source directory providing legacy dependencies which are built together with the DemoApplication.
  set(LEGACY_DIR "${PROJECT_SOURCE_DIR}/LegacyDependency"
      CACHE
      FORCE "LEGACY_DIR")

  # Location of Fancy Square Root directory where the sources and library will
  # be built
  set(FANCYSQUAREROOT_DIR "${PROJECT_SOURCE_DIR}/../FancySquareRoot"
      CACHE
      FORCE "FANCYSQUAREROOT_DIR")

  # Git hash to be used for building the FancySquareRoot library.
  # This allows for choosing a specific commit of the FancySquareRoot repository for building the FancySquareRoot dependency.
  set(FancySquareRoot_Commit_Hash "${ARGV1}"
      CACHE
      FORCE "FancySquareRoot_Commit_Hash")

  # Store the location of Google Test folder
  set(LocationOfGoogleTests "${ARGV3}" CACHE FORCE "LocationOfGoogleTests")

  # The name of the built FancySquareRoot library
  set(DADDY_LIB "FancySquareRoot" CACHE FORCE "FancySquareRoot")

endfunction(setGlobalVariables)
