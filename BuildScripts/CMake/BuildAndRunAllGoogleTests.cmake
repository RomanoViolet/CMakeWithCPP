include(CTest)
include(${CMAKE_CURRENT_SOURCE_DIR}/BuildScripts/CMake/RunGoogleTests.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/BuildScripts/CMake/ProvideGoogleTests.cmake)

function(BuildAndRunAllGoogleTests)
  
  # Downloads and installs GTest if not already installed on the host.
  ProvideGoogleTests()

  # Execute Google-tests. Uses CTest.
  rungoogletests()

endfunction(BuildAndRunAllGoogleTests)
