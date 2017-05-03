FROM nvidia/cuda:8.0-cudnn6-devel-ubuntu16.04

MAINTAINER William Grisaitis <grisaitisw@janelia.hhmi.org>

RUN apt-get update && apt-get install -y --no-install-recommends \
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
        bzip2 \
        ca-certificates \
        libglib2.0-0 \
        libxext6 \
        libsm6 \
        libxrender1 \
        mercurial \
        subversion && \
    rm -rf /var/lib/apt/lists/*

RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
    wget --quiet https://repo.continuum.io/miniconda/Miniconda2-4.3.11-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh

ENV PATH /opt/conda/bin:$PATH

ENV CAFFE_ROOT=/opt/caffe

WORKDIR $CAFFE_ROOT

ENV CLONE_TAG=master
ENV COMMIT_SHA1=2c829c123be337c61e50d22a2efd5150d7780199

RUN git clone -b ${CLONE_TAG} https://github.com/naibaf7/caffe.git . && \
    git checkout ${COMMIT_SHA1}

ADD Makefile.config $CAFFE_ROOT/Makefile.config

RUN make --jobs $(nproc)

RUN pip install --upgrade pip && \
    pip install wheel pydot && \
    for req in $(cat python/requirements.txt); do pip install $req; done

RUN make pycaffe --jobs $(nproc)

ENV PYCAFFE_ROOT $CAFFE_ROOT/python
ENV PYTHONPATH $PYCAFFE_ROOT:$PYTHONPATH
ENV PATH $CAFFE_ROOT/build/tools:$PYCAFFE_ROOT:$PATH
RUN echo "$CAFFE_ROOT/build/lib" >> /etc/ld.so.conf.d/caffe.conf && \
    ldconfig

RUN conda install --yes --channel flyem diced

WORKDIR /opt/malis
ENV COMMIT_SHA1=a1e084b0e0fec266c454431d786ac36b8ab6fe96

RUN git clone -b master --depth 1 https://github.com/TuragaLab/malis.git . && \
    git checkout ${COMMIT_SHA1} && \
    pip install numpy==1.11.3 && \
    python setup.py develop

WORKDIR /opt/waterz

ENV CLONE_TAG=master
ENV COMMIT_SHA1=d33f59c102a0a312ab11d18e366689dcb717385a

RUN git clone -b ${CLONE_TAG} --depth 1 https://github.com/funkey/waterz.git . && \
    git checkout ${COMMIT_SHA1} && \
    python setup.py develop

WORKDIR /opt/augment

ENV CLONE_TAG=master
ENV COMMIT_SHA1=49c601e2d4f633ee510fc7b10e3d962bd9386363

RUN git clone -b ${CLONE_TAG} --depth 1 https://github.com/funkey/augment.git . && \
    git checkout ${COMMIT_SHA1} && \
    python setup.py develop

WORKDIR /workspace
