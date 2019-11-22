# This function will simply copy the LegacyDependency to the correct location
# expected in the headers. The path where the LegacyDependency is copied over is
# expected by the source code already written but it has become very expensive
# to clone the legancy-repo because it is either slow, or the clone is too big,
# and only a small portion of the legacy-repo is required.
function(ProvideLegacyDependency)

  # Create the folder "ThirdPartySources" inside the
  # ${CMAKE_CURRENT_BINARY_DIR}. This prevents the pollution of the current
  # respository's structure during compile time as the
  # ${CMAKE_CURRENT_BINARY_DIR} is understood to be temporary, and is usually
  # ignored by the
  file(MAKE_DIRECTORY ${PATH_TO_COPY_LEGACY_SOURCES})

  # The custom target is always executed, if "ALL" is specified.
  add_custom_target(LegacyFileCopyTarget ALL)

  # The copy commands wrapped in the add_custom_command which is itself attached
  # to the LegacyFileCopy target.
  add_custom_command(
    TARGET LegacyFileCopyTarget
    COMMAND ${CMAKE_COMMAND} -E copy ${LEGACY_DIR}/*.h
            ${PATH_TO_COPY_LEGACY_SOURCES}
    COMMAND ${CMAKE_COMMAND} -E copy ${LEGACY_DIR}/*.c
            ${PATH_TO_COPY_LEGACY_SOURCES})

endfunction(ProvideLegacyDependency)
