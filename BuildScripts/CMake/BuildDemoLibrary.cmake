# Convenience function to be called from the main CMakeLists.txt
function(buildDemoLibrary)



  # tell CMake where to find all headers required by the sources.
  include_directories(
                        ${LEGACY_DIR} # so that sources can find legacy headers
                        ${PROJECT_SOURCE_DIR}/CoreFunctions/Interfaces # Interfaces required for components
                        ${FANCYSQUAREROOT_HEADER_DIR} # Headers related to the FancySquareRoot dependency
  )


  # include c files so that the linker can find the implementations
  # Legacy sources do not come with their CMakeLists.txt, so "add_subdirectory" is not an option
  file( GLOB_RECURSE LEGACY_SOURCES ${LEGACY_DIR}/*.c )
  #set_source_files_properties(${LEGACY_SOURCES} PROPERTIES LANGUAGE CXX)
  set_property(SOURCE "${LEGACY_SOURCES}" PROPERTY LANGUAGE CXX)

  #Sources related to Components A and B
  file( GLOB_RECURSE DEMOLIBRARY_SOURCES ${PROJECT_SOURCE_DIR}/CoreFunctions*.cpp )

  # Interfaces expected by Components
  add_subdirectory(${PROJECT_SOURCE_DIR}/CoreFunctions/Interfaces)

  add_library(DemoLibrary "${LEGACY_SOURCES}" "${DEMOLIBRARY_SOURCES}")
  set_target_properties(DemoLibrary PROPERTIES LINKER_LANGUAGE "CXX")

  # Link various  parts
  target_link_libraries(
                            DemoLibrary
                            PUBLIC FancySquareRoot
                    )


endfunction(buildDemoLibrary)
