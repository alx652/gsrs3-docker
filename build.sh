
PROJECT=hocon
PROGRESS='--progress=plain'
CACHE='--no-cache'
IMAGE_NAME=${gsrs3i-${PROJECT}:latest}


docker build -f Dockerfile.${PROJECT}.devel --ulimit nofile=65535:65535 $CACHE $PROGRESS  -t "${IMAGE_NAME}" . 
