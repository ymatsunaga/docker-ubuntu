FROM ubuntu:16.04
MAINTAINER Yasuhiro Matsunaga <ymatsunaga@riken.jp>

ENV DEBIAN_FRONTEND noninteractive
ENV OMP_NUM_THREADS 1

RUN apt-get update && apt-get install -y --no-install-recommends \
    binutils \
    bzip2 \
    gcc \
    gfortran \
    g++ \
    make \
    liblapack-dev \
    openmpi-bin \
    libopenmpi-dev \
#    libscalapack-openmpi1 \
    libscalapack-mpi-dev \
    openssh-client \
    openssh-server \
    python \
    wget \
    gnuplot-nox \
    gnuplot \
    vim \
    less \
    libnetcdf-dev \
    octave \
    liboctave-dev \
    git \
    automake \
    autoconf \
  && apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

RUN update-alternatives --install /usr/lib/libscalapack.a libscalapack.a /usr/lib/libscalapack-openmpi.a 10
RUN update-alternatives --install /usr/lib/libscalapack.so libscalapack.so /usr/lib/libscalapack-openmpi.so 10
RUN update-alternatives --install /usr/lib/libscalapack.so.1 libscalapack.so.1 /usr/lib/libscalapack-openmpi.so.1 10
RUN update-alternatives --install /usr/lib/libblacs.a libblacs.a /usr/lib/libblacs-openmpi.a 10
RUN update-alternatives --install /usr/lib/libblacs.so libblacs.so /usr/lib/libblacs-openmpi.so 10
RUN update-alternatives --install /usr/lib/libblacs.so.1 libblacs.so.1 /usr/lib/libblacs-openmpi.so.1 10

RUN groupadd -r yasu && useradd -r -g yasu yasu

# RUN echo x=1\:0.1:10\; y=sin\(t\)\; plot\(x,y\) >/home/yasu/.octave_hist

USER yasu
WORKDIR /home/yasu
WORKDIR /work

