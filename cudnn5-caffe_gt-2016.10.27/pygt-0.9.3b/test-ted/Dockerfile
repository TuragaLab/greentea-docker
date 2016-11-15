FROM turagalab/greentea:cudnn5-caffe_gt-2016.10.27-pygt-0.9.3b

RUN apt-get update && \
    apt-get install -y --no-install-recommends libfftw3-dev

WORKDIR /opt/ted

RUN git clone https://github.com/grisaitis/ted . && \
    git submodule update --init && \
    python setup.py install

WORKDIR /workspace
