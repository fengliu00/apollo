#!/usr/bin/env bash

###############################################################################
# Copyright 2019 The Apollo Authors. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
###############################################################################

# Fail on first error.
set -e

cd "$(dirname "${BASH_SOURCE[0]}")"

ARCH=$(uname -m)

apt clean

apt update -y 
apt install -y \
    bc \
    apt-transport-https \
    build-essential \
    gcc-4.8 \
    g++-4.8 \
    cmake \
    cppcheck \
    curl \
    curlftpfs \
    debconf-utils \
    doxygen \
    gdb \
    gfortran \
    git \
    automake \
    google-perftools \
    graphviz \
    lcov \
    libatlas-base-dev \
    libblas-dev \
    libboost-all-dev \
    libbz2-dev \
    libconsole-bridge-dev \
    libcurl4-openssl-dev \
    libeigen3-dev \
    libflann-dev \
    libfreetype6-dev \
    libgeos-dev \
    libgtest-dev \
    libhdf5-serial-dev \
    libicu-dev \
    liblapack-dev \
    libleveldb-dev \
    liblmdb-dev \
    libncurses5-dev \
    liblz4-dev \
    libopenblas-dev \
    libopencv-dev \
    libopenni-dev \
    libpcap-dev \
    libpoco-dev \
    libpoco-dev \
    libproj-dev \
    libqhull-dev \
    libsnappy-dev \
    libtinfo-dev \
    libtinyxml-dev \
    libyaml-cpp-dev \
    lsof \
    mpi-default-dev \
    nfs-common \
    python-autopep8 \
    python-matplotlib \
    python-pip \
    python-psutil \
    python-scipy \
    python3-psutil \
    python-opencv \
    sip-dev \
    subversion \
    sudo \
    unzip \
    uuid-dev \
    v4l-utils \
    vim \
    wget \
    zip \
    zlib1g-dev \
    libvtk7-dev \
    nasm \
    software-properties-common 

rm -rf /usr/bin/gcc /usr/bin/gcc-ar /usr/bin/gcc-nm  /usr/bin/gcc-ranlib /usr/bin/g++
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 10
update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 10
update-alternatives --install /usr/bin/cc cc /usr/bin/gcc 20
update-alternatives --set cc /usr/bin/gcc
update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++ 20
update-alternatives --set c++ /usr/bin/g++

GCCV=`gcc --version | grep \)\ 4.8.5$ `
GPLUSV=`g++ --version | grep \)\ 4.8.5$ `

if [ -z "$GCCV" ] || [ -z "$GPLUSV" ]; then
    echo "gcc-4.8/g++-4.8 installation or config failed"
    exit 1;
fi

echo "Default gcc version: $GCCV" 
echo "Default g++ version: $GPLUSV" 
