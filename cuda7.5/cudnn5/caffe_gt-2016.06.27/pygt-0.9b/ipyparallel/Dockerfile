FROM turagalab/greentea:cudnn5-caffe_gt-pygt-0.9b

MAINTAINER William Grisaitis <grisaitisw@janelia.hhmi.org>

RUN pip install ipyparallel

CMD HOME=$(pwd) ipengine --profile=greentea

