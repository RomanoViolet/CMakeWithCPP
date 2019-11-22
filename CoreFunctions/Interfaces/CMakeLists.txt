# Get a list of all source files.
file(GLOB_RECURSE SRC *.hpp *.inl *.cpp)

# Compile the interface files into a library
add_library(Interfaces STATIC ${SRC})
add_dependencies(Interfaces googletest)

# tell CMake where to find all GTest Production Headers.
include_directories(
                    ${GTEST_INCLUDE_DIRS} # Google Test Production Headers.
                    ${CMAKE_CURRENT_BINARY_DIR}/googletest-src/googletest/include
                    ${GOOGLETESTINSTALLDIRECTORY}
                   )

# In case of .inl files which CMake cannot associate to C++. Set the language
# explicitly. At the moment, only .cpp and .hpp files have been provided.
set_target_properties(Interfaces PROPERTIES LINKER_LANGUAGE CXX)
