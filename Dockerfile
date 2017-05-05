FROM nvidia/cuda:8.0-cudnn6-devel-ubuntu16.04
LABEL maintainer jfunke@iri.upc.edu

ENV CAFFE_ROOT=/src/caffe
ENV CAFFE_REPOSITORY=https://github.com/naibaf7/caffe.git
ENV CAFFE_REVISION=6c559baca26c6436d277839292894c1e3f2549a0

# install dependencies of caffe

RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        cmake \
        git \
        wget \
        libatlas-base-dev \
        libboost-all-dev \
        libgflags-dev \
        libgoogle-glog-dev \
        libhdf5-serial-dev \
        libleveldb-dev \
        liblmdb-dev \
        libopencv-dev \
        libprotobuf-dev \
        libsnappy-dev \
        protobuf-compiler \
        python-dev \
        python-numpy \
        python-pip \
        python-setuptools \
        python-scipy && \
    rm -rf /var/lib/apt/lists/*

# compile caffe

WORKDIR $CAFFE_ROOT
RUN git clone ${CAFFE_REPOSITORY} . && \
    git checkout ${CAFFE_REVISION}
RUN pip install --upgrade pip && \
    cd python && for req in $(cat requirements.txt) pydot; do pip install $req; done && cd ..
RUN mkdir build && \
    cd build && \
    cmake -DUSE_INDEX_64=1 -DUSE_CUDA=1 -DUSE_LIBDNN=0 -DUSE_CUDNN=1 -DUSE_OPENMP=0 -DUSE_GREENTEA=0 .. && \
    make -j"$(nproc)"

# setup env to find pycaffe

ENV PYCAFFE_ROOT $CAFFE_ROOT/python
ENV PYTHONPATH $PYCAFFE_ROOT:$PYTHONPATH
ENV PATH $CAFFE_ROOT/build/tools:$PYCAFFE_ROOT:$PATH
RUN echo "$CAFFE_ROOT/build/lib" >> /etc/ld.so.conf.d/caffe.conf && ldconfig

# install dependencies for gunpowder

WORKDIR /src
RUN git clone https://github.com/srinituraga/malis
WORKDIR /src/malis
RUN python setup.py install

WORKDIR /src
RUN git clone https://github.com/funkey/augment
WORKDIR /src/augment
RUN python setup.py install

WORKDIR /src
RUN git clone https://github.com/TuragaLab/dvision
WORKDIR /src/dvision
RUN pip install -r requirements.txt
RUN python setup.py install

# install gunpowder

WORKDIR /src/gunpowder
ENV GUNPOWDER_REVISION=9a44247157f0b23f9ce25536fd06eec3b6c6ce44
RUN git clone https://github.com/TuragaLab/gunpowder . && \
    git checkout ${GUNPOWDER_REVISION} && \
    pip install -e .

# test the container

WORKDIR /run
ADD test_environment.py /run

# run a test
CMD ["python", "test_environment.py"]
