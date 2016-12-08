docker build --pull --no-cache -t turagalab/greentea:cudnn5-caffe_gt-2016.12.05                 ./cudnn5-caffe_gt-2016.12.05
docker build        --no-cache -t turagalab/greentea:cudnn5-caffe_gt-2016.12.05-pygt-0.9.4b     ./cudnn5-caffe_gt-2016.12.05/pygt-0.9.4b

docker build --pull --no-cache \
    -t turagalab/greentea:cuda8.0-cudnn5-caffe_gt-2016.12.02 \
    ./cuda8.0-cudnn5-caffe_gt-2016.12.02
docker build        --no-cache \
    -t turagalab/greentea:cuda8.0-cudnn5-caffe_gt-2016.12.02-pygt-0.9.4b \
    ./cuda8.0-cudnn5-caffe_gt-2016.12.02/pygt-0.9.4b

docker build --pull --no-cache -t turagalab/greentea:cudnn5-caffe_gt-2016.12.02                 ./cudnn5-caffe_gt-2016.12.02
docker build        --no-cache -t turagalab/greentea:cudnn5-caffe_gt-2016.12.02-pygt-0.9.4b     ./cudnn5-caffe_gt-2016.12.02/pygt-0.9.4b

docker build --pull --no-cache -t turagalab/greentea:cudnn5-caffe_gt-2016.10.27                 ./cudnn5-caffe_gt-2016.10.27
docker build        --no-cache -t turagalab/greentea:cudnn5-caffe_gt-2016.10.27-pygt-0.9.2b     ./cudnn5-caffe_gt-2016.10.27/pygt-0.9.2b
docker build        --no-cache -t turagalab/greentea:cudnn5-caffe_gt-2016.10.27-pygt-0.9.3b     ./cudnn5-caffe_gt-2016.10.27/pygt-0.9.3b

docker build --pull --no-cache -t turagalab/greentea:cudnn5-caffe_gt                            ./cudnn5-caffe_gt
docker build        --no-cache -t turagalab/greentea:cudnn5-caffe_gt-pygt                       ./cudnn5-caffe_gt/pygt
docker build        --no-cache -t turagalab/greentea:cudnn5-caffe_gt-pygt-0.6                   ./cudnn5-caffe_gt/pygt-0.6
docker build        --no-cache -t turagalab/greentea:cudnn5-caffe_gt-pygt-0.9                   ./cudnn5-caffe_gt/pygt-0.9
docker build        --no-cache -t turagalab/greentea:cudnn5-caffe_gt-pygt-0.9b                  ./cudnn5-caffe_gt/pygt-0.9b
docker build        --no-cache -t turagalab/greentea:cudnn5-caffe_gt-pygt-0.9c                  ./cudnn5-caffe_gt/pygt-0.9c
docker build                   -t turagalab/greentea:cudnn5-caffe_gt-pygt-0.9d                  ./cudnn5-caffe_gt/pygt-0.9d

