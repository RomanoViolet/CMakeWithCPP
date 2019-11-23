include(ExternalProject)
function(ProvideGoogleTests)
    find_package( GTest QUIET)
    if ( NOT GTEST_FOUND )
        message ("--------------------------------------------------------------------------------")
        message ("                                                                                ")
        message (" Gtest Needs to be built from source. ")
        message ("                                                                                ")
        message ("--------------------------------------------------------------------------------")
        include (${CMAKE_CURRENT_SOURCE_DIR}/BuildScripts/CMake/BuildGoogleTestFromSources.cmake)

        BuildGoogleTestFromSources()
        enable_testing()
        add_custom_target(
                            RequiredGoogleTestHeaders
                            ALL
                            DEPENDS
                            googletest
                            )
    else()
        message ("--------------------------------------------------------------------------------")
        message ("                                                                                ")
        message (" Not Building Google Tests since these are installed on the development system. ")
        message ("                                                                                ")
        message ("--------------------------------------------------------------------------------")

        enable_testing()
        find_package(GTest REQUIRED)
        message("GTEST_INCLUDE_DIRS: " + ${GTEST_INCLUDE_DIRS})
        add_custom_target(RequiredGoogleTestHeaders DEPENDS ${GTEST_INCLUDE_DIRS}/gtest/gtest_prod.h)
    endif( NOT GTEST_FOUND )

endfunction(ProvideGoogleTests)
