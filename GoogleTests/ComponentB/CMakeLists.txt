# Configure google-test as a downloadable library.
include(${PROJECT_SOURCE_DIR}/BuildScripts/CMake/BuildGoogleTests.cmake)
find_package(GTest REQUIRED)
# The name of this directory
get_filename_component(ThisGoogleTestDirectory ${CMAKE_CURRENT_SOURCE_DIR} NAME)


# Add Local sources
file(GLOB_RECURSE TEST_SRC ${CMAKE_CURRENT_LIST_DIR}/*.cpp)

if ( TEST_SRC )

    # Implementation of Component B
    file(GLOB_RECURSE COMPONENTB_SRC ${PROJECT_SOURCE_DIR}/CoreFunctions/ComponentB/*.cpp)

    # Legacy sources
    ADD_CUSTOM_TARGET(LegacyDependencies DEPENDS "${PATH_TO_COPY_LEGACY_SOURCES}/*.c")
    file(GLOB_RECURSE LEGACY_SRC ${LEGACY_DIR}/*.c)
    message("From GoogleTest/ComponentB CMakeLists.txt: LEGACY_SRC: ${LEGACY_SRC}")
    set_source_files_properties(${LEGACY_SRC} PROPERTIES LANGUAGE CXX)

    # Lib includes
    add_executable(${ThisGoogleTestDirectory}_GoogleTest "${TEST_SRC}" "${COMPONENTB_SRC}" "${LEGACY_SRC}")



    target_include_directories(${ThisGoogleTestDirectory}_GoogleTest
    			PUBLIC
          $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/CoreFunctions/Interfaces> # All data types used in the definition of core-functions.
          $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/CoreFunctions/ComponentB> # Header for Component B
          $<BUILD_INTERFACE:${PATH_TO_COPY_LEGACY_SOURCES}> # Legacy sources
	  )


    set_target_properties(${ThisGoogleTestDirectory}_GoogleTest PROPERTIES LINKER_LANGUAGE CXX)
    target_link_libraries(${ThisGoogleTestDirectory}_GoogleTest DemoLibrary Interfaces Threads::Threads
    gmock_main
    gtest_main
    gtest
    gmock)
    #target_link_libraries(${ThisGoogleTestDirectory}_GoogleTest DemoLibrary gtest gtest_main gmock gmock_main pthread)

    add_dependencies( AllGoogleTests ${ThisGoogleTestDirectory}_GoogleTest)
    set(UNIT_TEST_TARGETS ${UNIT_TEST_TARGETS} ${ThisGoogleTestDirectory}_GoogleTest PARENT_SCOPE)
    add_test (${ThisGoogleTestDirectory}_GoogleTest ${CMAKE_CURRENT_BINARY_DIR}/${ThisGoogleTestDirectory}_GoogleTest)
endif()
