[![Docker Layers](https://images.microbadger.com/badges/image/chatopera/cmake:3.13.3.svg)](https://microbadger.com/images/chatopera/cmake:3.13.3 "Get your own image badge on microbadger.com") [![Docker Version](https://images.microbadger.com/badges/version/chatopera/cmake:3.13.3.svg)](https://microbadger.com/images/chatopera/cmake:3.13.3 "Get your own version badge on microbadger.com") [![Docker Pulls](https://img.shields.io/docker/pulls/chatopera/cmake.svg)](https://hub.docker.com/r/chatopera/cmake/) [![Docker Stars](https://img.shields.io/docker/stars/chatopera/cmake.svg)](https://hub.docker.com/r/chatopera/cmake/) [![Docker Commit](https://images.microbadger.com/badges/commit/chatopera/cmake:3.13.3.svg)](https://microbadger.com/images/chatopera/cmake:3.13.3 "Get your own commit badge on microbadger.com")

# cmake-get-started

快速开始使用 [CMake](https://cmake.org/)，`app` 下有不同示例。

## 一键执行

下面的脚本可以一键执行所有示例程序，因为它依赖于 [Docker](https://www.docker.com/)，请事先安装。

```
./admin/run.sh
```

## 基础知识

[C++静态库与动态库](https://www.cnblogs.com/skynet/p/3372855.html)

[CMake Practice](./docs/CMakePractice.pdf)

## 示例程序

### t1

- 最简单的 CMake 程序
- In Source Build

### t2

- Out Souce Build
- 安装文件

### t3

- 发布动态库和静态库

### t4

- 在新项目中添加依赖`t3`中的静态库或动态库

### t5

- 加载系统预装入的 cmake 模块，以 CURL 模块为例

### t6

- 自定义 `FindHELLO.cmake`，将`t3`代码封装为模块

## 执行全部示例

```
./admin/all.sh
```

## 鸣谢

本示例程序是基于[CMake Practice](http://file.ncnynl.com/ros/CMake%20Practice.pdf)的内容完成的。

## 开源许可协议

Copyright (2018) <a href="https://www.chatopera.com/" target="_blank">北京华夏春松科技有限公司</a>

[Apache License Version 2.0](https://github.com/chatopera/cmake-get-started/blob/master/LICENSE)

[![chatoper banner][co-banner-image]][co-url]

[co-banner-image]: https://user-images.githubusercontent.com/3538629/42383104-da925942-8168-11e8-8195-868d5fcec170.png
[co-url]: https://www.chatopera.com
