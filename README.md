# cmake-get-started

快速开始使用 CMake，app 下有不同 Sample。

## 执行全部示例

```
./admin/all.sh
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

## 鸣谢

本示例程序是基于[CMake Practice](http://file.ncnynl.com/ros/CMake%20Practice.pdf)的内容完成的。
