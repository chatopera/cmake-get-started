# Container for building and testing cmake-get-started with CMake
# original Dockerfile borrow from https://github.com/ttroy50/cmake-examples
FROM ubuntu:16.04
MAINTAINER Hai Liang Wang <hain@chatopera.com>

ARG CMAKE_VERSION

ARG VCS_REF

LABEL org.label-schema.vcs-ref=$VCS_REF \
          org.label-schema.vcs-url="https://github.com/chatopera/cmake-get-started"

RUN apt-get update && apt-get install -y build-essential \
    tzdata \
    libcurl4-openssl-dev \
    libboost-all-dev \
    libprotobuf-dev \
    libevent-dev \
    libssl-dev \
    libtool \
    flex \
    bison \
    pkg-config \
    protobuf-compiler \
    clang-3.6 \
    clang-format-3.6 \
    ninja-build \
    git \
    wget \
    python3 \ 
    python3-pip \
    openjdk-8-jdk \
    maven \
    autoconf \
    automake \
    cmake \
    && pip3 install conan \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai  /etc/localtime \
    && dpkg-reconfigure -f noninteractive tzdata \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN cd /opt \ 
    && wget https://cmake.org/files/v3.14/cmake-${CMAKE_VERSION}.tar.gz \
    && tar xvf cmake-${CMAKE_VERSION}.tar.gz \ 
    && cd cmake-${CMAKE_VERSION} \
    && ./bootstrap \
    && make \
    && make install \
    && cd .. \
    && rm -rf cmake*

# cppcheck
RUN cd /opt \
    && wget https://github.com/danmar/cppcheck/archive/1.79.tar.gz \
    && tar xvf 1.79.tar.gz \
    && cd cppcheck-1.79 \
    && mkdir build \
    && cd build \
    && cmake .. \
    && make install \
    && cd ../.. && rm -rf cppcheck*

# RUN cd /opt \
#     && wget https://github.com/tianon/gosu/releases/download/1.10/gosu-amd64 \
#     && mv gosu-amd64 /usr/local/bin/gosu \
#     && chmod +x /usr/local/bin/gosu

RUN cd /opt \
    && wget https://www.apache.org/dist/thrift/0.10.0/thrift-0.10.0.tar.gz \
    && tar -xvf thrift-0.10.0.tar.gz \
    && cd thrift-0.10.0 \
    && ./configure --with-lua=no \
    && make && make install \
    && echo "export LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:/usr/local/lib/" >> /etc/environment \
    && cd .. && rm -rf thrift* 

# Set the locale
ENV LANG C.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL C.UTF-8

# set ENVs
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV MAVEN_HOME=/usr/share/maven
ENV PATH=$PATH:$JAVA_HOME/bin:$MAVEN_HOME/bin

EXPOSE 9100-9120

CMD ["/bin/bash"]
ENTRYPOINT [""]