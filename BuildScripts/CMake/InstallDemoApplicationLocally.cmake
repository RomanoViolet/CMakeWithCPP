# https://pabloariasal.github.io/2018/02/19/its-time-to-do-cmake-right/
# https://rix0r.nl/blog/2015/08/13/cmake-guide/
# https://www.slideshare.net/DanielPfeifer1/cmake-48475415
# https://cliutils.gitlab.io/modern-cmake/chapters/install/installing.html
function(InstallDemoLibrary)

  # The following custom command will cause the install to always execute after
  # the build. Else, "make install" needs to be called separately.
  # https://stackoverflow.com/a/29712310
  add_custom_command(
    TARGET DemoLibrary POST_BUILD COMMAND ${CMAKE_COMMAND} --build
                                          ${CMAKE_BINARY_DIR} --target install)

  # Suppress file-by-file install step notifications
  set(CMAKE_INSTALL_MESSAGE "NEVER")

  # Get the user supplied install location.
  set(InstallLocation "${ARGV1}")

  # Set the version of the library Adapted from
  # https://foonathan.net/blog/2016/03/03/cmake-install.html
  set(DemoLibrary_VERSION_MAJOR
      "${ARGV3}"
      CACHE STRING "Major Version" FORCE)

  set(DemoLibrary_VERSION_MINOR
      "${ARGV5}"
      CACHE STRING "Minor Version" FORCE)

  set(DemoLibrary_VERSION
      ${DemoLibrary_VERSION_MAJOR}.${DemoLibrary_VERSION_MINOR}
      CACHE STRING "version" FORCE)

  # paths to include/ and library
  set(DemoLibrary_IncPath "${InstallLocation}-${DemoLibrary_VERSION}/inc")
  set(DemoLibrary_LibPath "${InstallLocation}-${DemoLibrary_VERSION}/lib")

  file(MAKE_DIRECTORY "${DemoLibrary_IncPath}")
  file(MAKE_DIRECTORY "${DemoLibrary_LibPath}")

  # Install the DemoLibrary Install does not like targets created from another
  # file: https://stackoverflow.com/questions/34443128/cmake-install-targets-in-
  # subdirectories
  install(
    TARGETS DemoLibrary
    EXPORT DemoLibrary-export
    LIBRARY DESTINATION "${DemoLibrary_LibPath}"
    ARCHIVE DESTINATION "${DemoLibrary_LibPath}")

  install(
    EXPORT DemoLibrary-export
    FILE DemoLibraryTargets.cmake
    NAMESPACE DL::
    DESTINATION "${DemoLibrary_LibPath}")

  # Make the header files available Collect the list of header files to be
  # exported
  file(GLOB_RECURSE DemoLibraryHeaders
       ${PROJECT_SOURCE_DIR}/CoreFunctions/*.hpp)
  install(FILES ${DemoLibraryHeaders} DESTINATION "${DemoLibrary_IncPath}")

endfunction(InstallDemoLibrary)
