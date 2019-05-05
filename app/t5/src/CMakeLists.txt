# 定义构建目标
ADD_EXECUTABLE(curltest main.c)

# 增加依赖
## FindCURL模块是CMake系统预存在的模块，比如下面
## 的命令最终定位到 /usr/lib/libcurl.dylib
## 然后，载进行加载，添加依赖
FIND_PACKAGE(CURL)
IF(CURL_FOUND)
    MESSAGE(STATUS "CURL_INCLUDE_DIR -->" ${CURL_INCLUDE_DIR})
    INCLUDE_DIRECTORIES(${CURL_INCLUDE_DIR})
    MESSAGE(STATUS "CURL_LIBRARY -->" ${CURL_LIBRARY})
    TARGET_LINK_LIBRARIES(curltest ${CURL_LIBRARY})
ELSE(CURL_FOUND)
    MESSAGE(FATAL_ERROR "CURL library not found")
ENDIF(CURL_FOUND)