FROM turagalab/greentea:cudnn5-caffe_gt-pygt-0.9b

MAINTAINER William Grisaitis <grisaitisw@janelia.hhmi.org>

RUN pip install jupyter

RUN echo $(id)

CMD HOME=$(pwd) jupyter notebook --no-browser --ip="*"

EXPOSE 8888
