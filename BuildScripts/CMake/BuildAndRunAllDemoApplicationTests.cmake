include(${CMAKE_CURRENT_SOURCE_DIR}/BuildScripts/CMake/BuildGoogleTests.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/BuildScripts/CMake/RunGoogleTests.cmake)

function(BuildAndRunAllVMCTests)

  buildgoogletests()
  rungoogletests()

endfunction(BuildAndRunAllVMCTests)
