FROM turagalab/greentea:cuda8.0-cudnn6-caffe_gt-2017.04.17

MAINTAINER William Grisaitis <grisaitisw@janelia.hhmi.org>

WORKDIR /opt/PyGreentea

ENV CLONE_TAG=v0.9.4b

RUN git clone -b ${CLONE_TAG} --depth 1 https://github.com/TuragaLab/PyGreentea.git . && \
    for req in $(cat requirements.txt) pydot; do pip install $req; done

ENV PYTHONPATH /opt/PyGreentea:$PYTHONPATH

WORKDIR /workspace
