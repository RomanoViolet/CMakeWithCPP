# Improvements: https://mirkokiefer.com/cmake-by-example-f95eb47d45b1?gi=c8a60503c338

include(ExternalProject)

set (FancySquareRootWorkingDirectory ${CMAKE_CURRENT_BINARY_DIR}/Downloads/FancySquareRoot)

function(getFancySquareRoot)

  #set_directory_properties(PROPERTIES EP_BASE ${CMAKE_CURRENT_BINARY_DIR}/ExternalSources)
  externalproject_add(FancySquareRoot_project
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
                      ${CMAKE_CURRENT_BINARY_DIR}/LocalInstalls

                      CMAKE_ARGS
                      -DCMAKE_INSTALL_PREFIX=<INSTALL_DIR> # prefix needs to be specified if INSTALL_DIR is specified.

                      INSTALL_COMMAND
                      cp ${FancySquareRootWorkingDirectory}/src/FancySquareRoot_project-build/libFancySquareRoot.a <INSTALL_DIR>

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
                      ${FancySquareRootWorkingDirectory}/src/FancySquareRoot_project-build/libFancySquareRoot.a

                  )

                  #find_package(FancySquareRoot REQUIRED)
                  #set(LIBS ${LIBS} ${FANCYSQUAREROOT_LIBRARIES})

                  ExternalProject_Get_Property(FancySquareRoot_project INSTALL_DIR)
                  message ("Fancy Installed location: ${INSTALL_DIR}")
                  add_library(FancySquareRoot STATIC IMPORTED)
                  set_property(TARGET FancySquareRoot PROPERTY IMPORTED_LOCATION ${INSTALL_DIR}/libFancySquareRoot.a)
                  add_dependencies(FancySquareRoot FancySquareRoot_project)

endfunction(getFancySquareRoot)
