_SUDO=''
PROJECT=${PROJECT:-hocon}
PROGRESS=${PROGRESS:-'--progress=plain'}
CACHE=${CACHE:-'--no-cache'}
DEFAULT_IMAGE_NAME=gsrs3i-${PROJECT}:latest
IMAGE_NAME=${IMAGE_NAME:-$DEFAULT_IMAGE_NAME}

$_SUDO docker build -f Dockerfile.${PROJECT}.devel --ulimit nofile=65535:65535 $CACHE $PROGRESS  -t "${IMAGE_NAME}" . 
