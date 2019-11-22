# Do not assume that the Google Test framework is preinstalled. Instead, clone the library, and buiid it locally.
# Adapted from : https://gist.github.com/johnb003/65982fdc7a1274fdb023b0c68664ebe4
# Paths for libraries are updated.
function(BuildGoogleTests)
    include_directories( ${GTEST_INCLUDE_DIR} )
    enable_testing()
    if (BUILD_TESTING)
        add_subdirectory("${LocationOfGoogleTests}")
    endif( BUILD_TESTING )   
    message("LocationOfGoogleTests-Post: " + ${LocationOfGoogleTests})

    #add_custom_target( AllGoogleTests ALL DEPENDS ${GTEST_LIBRARIES} ${GMOCK_LIBRARIES} ${UNIT_TEST_TARGETS})
endfunction(BuildGoogleTests)
