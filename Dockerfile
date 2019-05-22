# Container for building and testing cmake-get-started with CMake
# original Dockerfile borrow from https://github.com/ttroy50/cmake-examples
FROM ubuntu:18.04
MAINTAINER Hai Liang Wang <hain@chatopera.com>

ARG DEBIAN_FRONTEND=noninteractive
ARG CMAKE_VERSION

ARG VCS_REF

LABEL org.label-schema.vcs-ref=$VCS_REF \
          org.label-schema.vcs-url="https://github.com/chatopera/cmake-get-started"

#COPY $PWD/assets/aliyun.sources.list /etc/apt/sources.list

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
    clang \
    clang-format \
    ninja-build \
    git \
    wget \
    python3 \
    python3-pip \
    openjdk-8-jdk \
    maven \
    autoconf \
    automake \
    ack-grep \
    && pip3 install conan \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai  /etc/localtime \
    && DEBIAN_FRONTEND=noninteractive dpkg-reconfigure --frontend noninteractive tzdata \
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
    && cd ../.. && rm -rf cppcheck* 1.79.tar.gz

# RUN cd /opt \
#     && wget https://github.com/tianon/gosu/releases/download/1.10/gosu-amd64 \
#     && mv gosu-amd64 /usr/local/bin/gosu \
#     && chmod +x /usr/local/bin/gosu

#RUN cd /opt \
#    && wget https://www.apache.org/dist/thrift/0.12.0/thrift-0.12.0.tar.gz \
#    && tar -xvf thrift-0.12.0.tar.gz \
#    && cd thrift-0.12.0 \
#    && ./configure --with-lua=no \
#    && make && make install \
#    && echo "export LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:/usr/local/lib/" >> /etc/environment \
#    && cd .. && rm -rf thrift* 

# Set the locale
ENV LANG C.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL C.UTF-8

# set ENVs
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV MAVEN_HOME=/usr/share/maven
ENV PATH=$PATH:$JAVA_HOME/bin:$MAVEN_HOME/bin:/workspace/bin
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib/:/workspace/lib

# config
COPY $PWD/assets/_gitconfig /root/.gitconfig

RUN mkdir /workspace
WORKDIR /workspace

EXPOSE 9870-9880

CMD ["/bin/bash"]
ENTRYPOINT [""]
