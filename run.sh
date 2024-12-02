PROJECT='hocon'
IMAGE_NAME='gsrs3i-${PROJECT}:latest'
VOLUME='/Users/welscha2/Documents/d/fda/gsrs3/docker/volumes/v1hocon:/home/srs'
DB_DDL_AUTO='update'

CONTAINER_NAME=gsrs3c-${PROJECT}
# docker cp frontend_config.json $CONTAINER_NAME:/usr/local/tomcat/webapps/frontend/WEB-INF/classes/static/assets/data/config.json

docker run --name $CONTAINER_NAME -d -p 8080:8080 -v $VOLUME -e CATALINA_OPTS='-Xms20g -Xmx20g -XX:ReservedCodeCacheSize=512m' -e DB_DDL_AUTO=$DB_DDL_AUTO $IMAGE_NAME
