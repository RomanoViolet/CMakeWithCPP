# Clones MOM to provide VFC and DADDY
include(ExternalProject)

# Convenience function to build FancySquareRoot
include(
${CMAKE_CURRENT_SOURCE_DIR}/BuildScripts/CMake/BuildFancySquareRoot.cmake)

set (FancySquareRootWorkingDirectory ${CMAKE_CURRENT_BINARY_DIR}/Downloads/FancySquareRoot)

function(getFancySquareRoot)

  #set_directory_properties(PROPERTIES EP_BASE ${CMAKE_CURRENT_BINARY_DIR}/ExternalSources)
  externalproject_add(FancySquareRoot
                      PREFIX
                      ${FancySquareRootWorkingDirectory} #top level directory in which the repository will be cloned.

                      #GIT_REPOSITORY
                      #https://github.com/RomanoViolet/FancySquareRoot.git

                      #GIT_TAG
                      #${FancySquareRoot_Commit_Hash}

                      #UPDATE_DISCONNECTED
                      #1

                      URL # Download from a local folder instead of cloning from GitHub
                      ${PROJECT_SOURCE_DIR}/../FancySquareRoot

                      #UPDATE_COMMAND # Not required if a specific commit is asked for.
                      #${GIT_EXECUTABLE} pull

                      PATCH_COMMAND
                      ""

                      BUILD_ALWAYS
                      TRUE

                      CONFIGURE_COMMAND
                      ""

                      SOURCE_DIR
                      ${FancySquareRootWorkingDirectory}/src/FancySquareRoot

                      INSTALL_DIR
                      ${SOURCE_DIR}/bin

                      CONFIGURE_COMMAND #Explicitly specify where to run cmake since CMake assumes that CMakeLists.txt for external project is available under ${PREFIX}/src
                      ${CMAKE_COMMAND} ${FancySquareRootWorkingDirectory}/src/FancySquareRoot

                      #COMMAND FILE( MAKE_DIRECTORY "${SOURCE_DIR}/build" )
                      #COMMAND "${CMAKE_COMMAND} ${CMAKE_CURRENT_BINARY_DIR}/Downloads/src/FancySquareRoot --build"
                      #COMMAND ${MAKE}
                      #WORKING_DIRECTORY
                      #${BINARY_DIR}

                      #BINARY_DIR
                      #${SOURCE_DIR}/build

                      BUILD_BYPRODUCTS
                      ${FancySquareRootWorkingDirectory}/src/FancySquareRoot-build/libFancySquareRoot.a

                    INSTALL_COMMAND
                    ""
                  )

endfunction(getFancySquareRoot)
