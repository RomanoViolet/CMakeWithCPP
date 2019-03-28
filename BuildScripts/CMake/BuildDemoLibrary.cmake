# Convenience function to be called from the main CMakeLists.txt
function(buildDemoLibrary)
  # ------------------Add subdirectories------------------#

  # get the basepath to VMC. All paths are relative to this.
  get_property(BasePathToVMC GLOBAL PROPERTY BasePathToVMC)

  # Algorithms
  add_subdirectory(${BasePathToVMC}/vmc/algorithms)

  # Modules
  add_subdirectory(${BasePathToVMC}/vmc/modules)

  # Runnables
  add_subdirectory(${BasePathToVMC}/vmc/runnables)

  # ------------------Build VMC library------------------#
  add_library(VMC
              $<TARGET_OBJECTS:ObjLibAsket>
              $<TARGET_OBJECTS:ObjLibHelpers>
              $<TARGET_OBJECTS:ObjLibControllers>
              $<TARGET_OBJECTS:ObjLibActManLatRunnable>
              $<TARGET_OBJECTS:ObjLibVMCExecutionRunnable>
              $<TARGET_OBJECTS:ObjLibGlueRunnable>
              $<TARGET_OBJECTS:ObjLibMotionDriverMonitoringRunnable>
              $<TARGET_OBJECTS:ObjVSERunnable>)

  target_include_directories(
    VMC
    PUBLIC $<INSTALL_INTERFACE:${CMAKE_INSTALL_PREFIX}/include> # for client in
                                                                # install mode
    )

  # target_link_libraries(VMC mom)
endfunction(buildDemoLibrary)
