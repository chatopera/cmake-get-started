cmake_minimum_required(VERSION 3.13)
PROJECT (HELLO)
SET(SRC_LIST main.c)
MESSAGE(STATUS "This is BINARY dir " ${HELLO_BINARY_DIR})
MESSAGE(STATUS "This is SOURCE dir "${HELLO_SOURCE_DIR})
MESSAGE(STATUS "SRC_LIST:"  ${SRC_LIST})
ADD_EXECUTABLE(hello ${SRC_LIST})