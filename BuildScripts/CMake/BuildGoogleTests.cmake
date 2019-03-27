include(GoogleTest)

function(BuildGoogleTests)

  # Find the Google Test package
  find_package(GTest REQUIRED)
  include_directories(${GTEST_INCLUDE_DIR})
  enable_testing()

  # get the basepath to VMC. All paths are relative to this.
  get_property(BasePathToVMC GLOBAL PROPERTY BasePathToVMC)

  # get the location where all google tests for VMC are kept
  get_property(LocationOfGoogleTests GLOBAL PROPERTY LocationOfGoogleTests)

  add_custom_target(AllGoogleTests ALL DEPENDS ${UNIT_TEST_TARGETS})

  if(BUILD_TESTING)

    # All VMC Google Tests
    # add_subdirectory("${LocationOfGoogleTests}/ActManLat")
    add_subdirectory("${LocationOfGoogleTests}/MDM")
    # add_subdirectory("${LocationOfGoogleTests}/DSM")
    # add_subdirectory("${LocationOfGoogleTests}/VMCCombined")
    add_subdirectory("${LocationOfGoogleTests}/VSE")

  endif(BUILD_TESTING)

endfunction(BuildGoogleTests)
