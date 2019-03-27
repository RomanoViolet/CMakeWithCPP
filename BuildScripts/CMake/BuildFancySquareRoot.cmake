# The function will build the FancySquareRoot library The name of the library
# created in "libFancySquareRoot.a"
function(getFancySquareRoot)
  file(GLOB_RECURSE DADDY_SRC "${MOM_DIR}/daddy/src/*.cpp"
                    "${MOM_DIR}/daddy/open_variation_point/cpp11/adapter/*.cpp")
  if(DADDY_SRC)
    add_library(DADDY "${DADDY_SRC}")
    target_include_directories(
      DADDY
      PUBLIC
        $<BUILD_INTERFACE:${MOM_DIR}/vfc/include> # Tolerate for now
        $<BUILD_INTERFACE:${MOM_DIR}/vfc/include/vfc/core> # For vfc_assert.hpp.
                                                           # Tolerate for now
        $<BUILD_INTERFACE:${MOM_DIR}/daddy/config/proxy_aurix_plus> # Interfaces
        $<BUILD_INTERFACE:${MOM_DIR}/daddy/config/generic_cpp11> # Interfaces
        $<BUILD_INTERFACE:${MOM_DIR}/daddy/open_variation_point/cpp11> # Interfaces
        $<BUILD_INTERFACE:${MOM_DIR}/daddy/inc> # Interfaces
        $<BUILD_INTERFACE:${DA_CORE_DIR}/src> # Includes required by Controllers
        $<BUILD_INTERFACE:${DA_CORE_DIR}/inc> # DA Core
        $<BUILD_INTERFACE:${MOM_DIR}/daddy/open_variation_point/cpp11> # DA Core
      )

    # target_include_directories(DADDY PUBLIC "${MOM_DIR}/daddy/inc")
  endif()

endfunction(getFancySquareRoot)
