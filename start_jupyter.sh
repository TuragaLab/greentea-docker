sudo mount --make-shared /nobackup/turaga

export NAME="greentea-notebook"

nvidia-docker run --rm \
    -it \
    -u `id -u $USER` \
    -v /groups/turaga/home:/groups/turaga/home \
    -v /nobackup/turaga:/nobackup/turaga:shared \
    -w /groups/turaga/home/$USER \
    -p 8888:8888 \
    --name $NAME \
    turagalab/greentea:cudnn5-caffe_gt-pygt-0.9b-jupyter \
    /bin/bash
