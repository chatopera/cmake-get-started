message(STATUS "print PROJECT_INSTALL_DIR" ${PROJECT_INSTALL_DIR})
message(STATUS "print CMAKE_C_FLAGS" ${CMAKE_C_FLAGS})

# 增加头文件搜索路径
## 因为设置了 CMAKE_CXX_FLAGS，下面这个include可以省略
# INCLUDE_DIRECTORIES(${PROJECT_INSTALL_DIR}/include)

ADD_EXECUTABLE(hello-t4 main.c)

# 动态库
## 下面与TARGET_LINK_LIBRARIES(main libhello.so)是一样的含义
# TARGET_LINK_LIBRARIES(hello-t4 hello)

# 静态库
## 上面依赖的是动态库，
## 因为在t3中，我们同样编译安装了静态库，此时改为对应的静态库如下
TARGET_LINK_LIBRARIES(hello-t4 libhello.a)

SET(EXECUTABLE_OUTPUT_PATH ${PROJECT_BINARY_DIR}/bin)
INSTALL(TARGETS hello-t4 DESTINATION bin)