FROM nvidia/cuda:11.8.0-cudnn8-devel-ubuntu20.04
#FROM nvcr.io/nvidia/cuda:11.8.0-cudnn8-devel-ubuntu20.04

#-----------------------------
# speeding up
#-----------------------------
RUN sed -i 's@archive.ubuntu.com@ftp.jaist.ac.jp/pub/Linux@g' /etc/apt/sources.list

#-----------------------------
# Environment Variables
#-----------------------------
ENV LC_ALL=C.UTF-8
ENV export LANG=C.UTF-8
ENV SHELL /bin/bash
# no need input key
ENV DEBCONF_NOWARNINGS=yes
ENV DEBIAN_FRONTEND noninteractive
# for display
ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES compute,utility

#-----------------------------
# install common library
#-----------------------------
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    python3-dev \
    python3-pip \
    python-is-python3 \
    git \
    nano\
    curl \
    screen \
    sudo \
    g++ \
    wget \
    net-tools \
    software-properties-common \
    make \
    libprotobuf-dev \
    protobuf-compiler \
    libopencv-dev \
    libgoogle-glog-dev \
    libboost-all-dev \
    libhdf5-dev \
    libpq-dev \
    libatlas-base-dev

#-------------------------------------
# install torch torchvision torchaudio
#-------------------------------------
RUN pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118

#-----------------------------
# install additional packageat
#-----------------------------
RUN pip3 install --upgrade pip
RUN pip3 install setuptools \
    progressbar2 \
    gdown \
    gitpython \
    git+https://github.com/cheind/py-thin-plate-spline \
    hickle \
    tensorboard \
    numpy \
    git+https://github.com/facebookresearch/segment-anything.git \
    gradio \
    opencv-python \
    matplotlib \
    pyyaml \
    av \
    openmim \
    tqdm \
    psutil

#######################################################################
#                       install display settings                         
#######################################################################
RUN apt-get install -y --no-install-recommends \
    libxau-dev \
    libxdmcp-dev \
    libxcb1-dev \
    libxext-dev \
    libx11-dev \
    mesa-utils \
    x11-apps

RUN git clone --recursive https://github.com/0xNOY/piecemaker.git
RUN cd piecemaker

ENV PYTHONPATH /usr/local/python
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib/
RUN echo "PYTHONPATH=/usr/local/python:$PYTHONPATH" >> ~/.bashrc && \
    /bin/bash -c  "source ~/.bashrc"

WORKDIR /piecemaker

