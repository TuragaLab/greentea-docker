FROM turagalab/greentea:cuda8.0-cudnn5-caffe_gt-2016.12.02

MAINTAINER William Grisaitis <grisaitisw@janelia.hhmi.org>

WORKDIR /opt/malis

RUN git clone -b master --depth 1 https://github.com/srinituraga/malis.git . && \
    pip install --upgrade numpy>=1.9 && \
    python setup.py install

WORKDIR /opt/waterz

ENV CLONE_TAG=v0.2

RUN git clone -b ${CLONE_TAG} --depth 1 https://github.com/funkey/waterz.git . && \
    python setup.py install

WORKDIR /opt/PyGreentea

ENV CLONE_TAG=v0.9.4b

RUN git clone -b ${CLONE_TAG} --depth 1 https://github.com/TuragaLab/PyGreentea.git . && \
    for req in $(cat requirements.txt) pydot; do pip install $req; done

ENV PYTHONPATH /opt/PyGreentea:$PYTHONPATH

WORKDIR /opt/h5pyd

RUN git clone https://github.com/HDFGroup/h5pyd . && \
    python setup.py install

WORKDIR /workspace
