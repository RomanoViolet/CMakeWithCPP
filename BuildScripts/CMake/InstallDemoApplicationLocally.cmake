function(installVMCLocally)

  # Silence the gazillion "installing..." message lines
  set(CMAKE_INSTALL_MESSAGE "NEVER")

  # Get the user supplied install location.
  set(InstallLocation "${ARGV1}")
  file(MAKE_DIRECTORY "${InstallLocation}")

  # Define install paths
  set(include_dest "${InstallLocation}/include")
  set(main_lib_dest "${InstallLocation}/lib")
  set(lib_dest ${main_lib_dest}/${BuildType})

  # Install VMC interfaces
  install(DIRECTORY ${PROJECT_SOURCE_DIR}/inc/vmc_interfaces
          DESTINATION ${include_dest})
  # Install Runnables interfaces
  file(GLOB_RECURSE RUNNABLE_HEADERS ${PROJECT_SOURCE_DIR}/vmc/runnables/*.hpp)
  install(FILES ${RUNNABLE_HEADERS} DESTINATION ${include_dest}/vmc_runnables)

  # Install Controllers interfaces
  file(GLOB_RECURSE CONTROLLER_HEADERS
                    ${PROJECT_SOURCE_DIR}/vmc/modules/controllers/*.hpp)
  install(FILES ${CONTROLLER_HEADERS}
          DESTINATION ${include_dest}/vmc/modules/controllers)
  # Install Helpers interfaces
  file(
    GLOB_RECURSE
      HELPER_HEADERS
      ${PROJECT_SOURCE_DIR}/vmc/modules/helpers/CorridorMonitoring/*.hpp)
  install(FILES ${HELPER_HEADERS}
          DESTINATION ${include_dest}/vmc/modules/helpers/CorridorMonitoring)
  file(GLOB_RECURSE HELPER_HEADERS
                    ${PROJECT_SOURCE_DIR}/vmc/modules/helpers/DSMAdapter/*.hpp)
  install(FILES ${HELPER_HEADERS}
          DESTINATION ${include_dest}/vmc/modules/helpers/DSMAdapter)

endfunction(installVMCLocally)
