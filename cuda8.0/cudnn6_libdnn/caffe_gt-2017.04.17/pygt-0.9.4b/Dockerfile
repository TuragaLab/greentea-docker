FROM turagalab/greentea:cuda8.0-cudnn6-caffe_gt-2017.04.17

MAINTAINER William Grisaitis <grisaitisw@janelia.hhmi.org>

WORKDIR /opt/malis

RUN git clone -b master --depth 1 https://github.com/srinituraga/malis.git . && \
    pip install --upgrade numpy==1.11.0 && \
    python setup.py install

WORKDIR /opt/waterz

ENV CLONE_TAG=master

RUN git clone -b ${CLONE_TAG} --depth 1 https://github.com/funkey/waterz.git . && \
    python setup.py install

WORKDIR /opt/PyGreentea

ENV CLONE_TAG=v0.9.4b

RUN git clone -b ${CLONE_TAG} --depth 1 https://github.com/TuragaLab/PyGreentea.git . && \
    for req in $(cat requirements.txt) pydot; do pip install $req; done

ENV PYTHONPATH /opt/PyGreentea:$PYTHONPATH

WORKDIR /workspace
