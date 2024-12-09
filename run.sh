


# Default variable assignment in bash
# https://unix.stackexchange.com/questions/122845/using-a-b-for-variable-assignment-in-scripts/122848#122848
USE_SUDO=${USE_SUDO:-''}
PROJECT="${PROJECT:-hocon}"
IMAGE_NAME="gsrs3i-${PROJECT}:latest"
# DEFAULT_LOCAL_VOLUME=$(cd .. && pwd)/volumes/v1$PROJECT
DEFAULT_LOCAL_VOLUME=/var/lib/gsrs
LOCAL_VOLUME="${LOCAL_VOLUME:-$DEFAULT_LOCAL_VOLUME}"
VOLUME=$LOCAL_VOLUME':/home/srs'
DB_DDL_AUTO=${DB_DDL_UPDATE:-update}

CONTAINER_NAME=gsrs3c-${PROJECT}

# Tip: use this to copy frontend config to running container. 
# docker cp frontend_config.json $CONTAINER_NAME:/usr/local/tomcat/webapps/frontend/WEB-INF/classes/static/assets/data/config.json

$USE_SUDO docker run --name $CONTAINER_NAME -d -p 8080:8080 -v $VOLUME -e CATALINA_OPTS='-Xms20g -Xmx20g -XX:ReservedCodeCacheSize=512m' -e DB_DDL_AUTO=$DB_DDL_AUTO $IMAGE_NAME
