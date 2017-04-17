docker build --pull --no-cache \
    -t turagalab/greentea:cuda8.0-libdnn-caffe_gt-2016.12.05 \
    ./cuda8.0/cudnn5+libdnn/caffe_gt-2016.12.05
docker build        --no-cache \
    -t turagalab/greentea:cuda8.0-libdnn-caffe_gt-2016.12.05-pygt-0.9.4b \
    ./cuda8.0/cudnn5+libdnn/caffe_gt-2016.12.05/pygt-0.9.4b

docker build --pull --no-cache \
    -t turagalab/greentea:libdnn-caffe_gt-2016.12.05 \
    ./cuda7.5/libdnn/caffe_gt-2016.12.05
docker build        --no-cache \
    -t turagalab/greentea:libdnn-caffe_gt-2016.12.05-pygt-0.9.4b \
    ./cuda7.5/libdnn/caffe_gt-2016.12.05/pygt-0.9.4b

docker build --pull --no-cache \
    -t turagalab/greentea:cudnn5-caffe_gt-2016.12.05 \
    ./cuda7.5/cudnn5/caffe_gt-2016.12.05
docker build        --no-cache \
    -t turagalab/greentea:cudnn5-caffe_gt-2016.12.05-pygt-0.9.4b \
    ./cuda7.5/cudnn5/caffe_gt-2016.12.05/pygt-0.9.4b

docker build --pull --no-cache \
    -t turagalab/greentea:cuda8.0-cudnn5-caffe_gt-2016.12.02 \
    ./cuda8.0/cudnn5/caffe_gt-2016.12.02
docker build        --no-cache \
    -t turagalab/greentea:cuda8.0-cudnn5-caffe_gt-2016.12.02-pygt-0.9.4b \
    ./cuda8.0/cudnn5/caffe_gt-2016.12.02/pygt-0.9.4b

docker build --pull --no-cache \
    -t turagalab/greentea:cudnn5-caffe_gt-2016.12.02 \
    ./cuda7.5/cudnn5/caffe_gt-2016.12.02
docker build        --no-cache \
    -t turagalab/greentea:cudnn5-caffe_gt-2016.12.02-pygt-0.9.4b \
    ./cuda7.5/cudnn5/caffe_gt-2016.12.02/pygt-0.9.4b

docker build --pull --no-cache \
    -t turagalab/greentea:cudnn5-caffe_gt-2016.10.27 \
    ./cuda7.5/cudnn5/caffe_gt-2016.10.27
docker build        --no-cache \
    -t turagalab/greentea:cudnn5-caffe_gt-2016.10.27-pygt-0.9.2b \
    ./cuda7.5/cudnn5/caffe_gt-2016.10.27/pygt-0.9.2b
docker build        --no-cache \
    -t turagalab/greentea:cudnn5-caffe_gt-2016.10.27-pygt-0.9.3b \
    ./cuda7.5/cudnn5/caffe_gt-2016.10.27/pygt-0.9.3b
