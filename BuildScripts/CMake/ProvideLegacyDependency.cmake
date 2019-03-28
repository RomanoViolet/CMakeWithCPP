# This function will simply copy the LegacyDependency to the correct location expected in the headers.
# The path where the LegacyDependency is copied over is expected by the source code already written
# but it has become very expensive to clone the legancy-repo because it is either slow, or the clone is too big, and only a small portion of the legacy-repo is required.
function(ProvideLegacyDependency)

  # Create the folder "ThirdPartySources" inside the ${CMAKE_CURRENT_BINARY_DIR}.
  # This prevents the pollution of the current respository's structure during compile time as the ${CMAKE_CURRENT_BINARY_DIR} is understood to be temporary, and is usually ignored by the

  set(PATH_TO_COPY_LEGACY_SOURCES "${CMAKE_CURRENT_BINARY_DIR}/ThirdPartySources")
  file(MAKE_DIRECTORY ${PATH_TO_COPY_LEGACY_SOURCES})

  file (  GLOB_RECURSE
          FILES_TO_COPY
          "${PROJECT_SOURCE_DIR}/LegacyDependency/*.h"
          "${PROJECT_SOURCE_DIR}/LegacyDependency/*.c"
       )

   foreach( thisSourceFile ${FILES_TO_COPY} )
     file (COPY ${thisSourceFile} DESTINATION ${PATH_TO_COPY_LEGACY_SOURCES})

   endforeach()


endfunction(ProvideLegacyDependency)
