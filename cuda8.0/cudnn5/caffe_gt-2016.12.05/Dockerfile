FROM nvidia/cuda:8.0-cudnn5-devel-ubuntu14.04

MAINTAINER William Grisaitis <grisaitisw@janelia.hhmi.org>

RUN apt-get update && \
    apt-get install -y --no-install-recommends --force-yes \
        build-essential \
        cmake \
        git \
        wget \
        opencl-headers \
        libboost-all-dev \
        libgflags-dev \
        libgoogle-glog-dev \
        libhdf5-serial-dev \
        libleveldb-dev \
        liblmdb-dev \
        libopenblas-dev \
        libopencv-dev \
        libprotobuf-dev \
        libsnappy-dev \
        libviennacl-dev \
        protobuf-compiler \
        python-dev \
        python-numpy \
        python-pip \
        python-scipy && \
    rm -rf /var/lib/apt/lists/*

ENV CAFFE_ROOT=/opt/caffe

WORKDIR $CAFFE_ROOT

ENV CLONE_TAG=master
ENV COMMIT_SHA1=019c3d50661104235a43bbeff15501d549764709

RUN git clone -b ${CLONE_TAG} https://github.com/naibaf7/caffe.git . && \
    git checkout ${COMMIT_SHA1}

ADD Makefile.config.turagalab $CAFFE_ROOT/Makefile.config

RUN find . -type f -exec sed -i -e 's^"hdf5.h"^"hdf5/serial/hdf5.h"^g' -e 's^"hdf5_hl.h"^"hdf5/serial/hdf5_hl.h"^g' '{}' \;

RUN make --jobs $(nproc)

RUN for req in $(cat python/requirements.txt) pydot; do pip install $req; done

RUN make pycaffe --jobs $(nproc)

ENV PYCAFFE_ROOT $CAFFE_ROOT/python
ENV PYTHONPATH $PYCAFFE_ROOT:$PYTHONPATH
ENV PATH $CAFFE_ROOT/build/tools:$PYCAFFE_ROOT:$PATH
RUN echo "$CAFFE_ROOT/build/lib" >> /etc/ld.so.conf.d/caffe.conf && ldconfig

WORKDIR /workspace
