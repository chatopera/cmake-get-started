SET(EXECUTABLE_OUTPUT_PATH ${PROJECT_BINARY_DIR}/bin)
ADD_EXECUTABLE(hello-t2 main.c)
INSTALL(TARGETS hello-t2 DESTINATION bin)