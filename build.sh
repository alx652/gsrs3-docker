

# export _MODULE_IGNORE_SUBSTANCES_ONLY='adverse-events applications clinical-trials discovery frontend gateway impurities invitro-pharmacology products ssg4m'
# export _MODULE_IGNORE_SUBSTANCES_PLUS='adverse-events applications clinical-trials discovery impurities invitro-pharmacology products ssg4m'
# export _MODULE_IGNORE_FRONTEND_ONLY='adverse-events applications clinical-trials discovery gateway impurities invitro-pharmacology products ssg4m substances'
# export _MODULE_IGNORE_GATEWAY_ONLY="adverse-events applications clinical-trials discovery frontend impurities invitro-pharmacology products ssg4m substances"

# export _STARTER_MOUDULES_SUBSTANCES_ONLY="gsrs-spring-starter:master gsrs-spring-module-substances:master"
# export _STARTER_MOUDULES_SUBSTANCES_PLUS="gsrs-spring-starter:master gsrs-spring-module-substances:master"
# Remove any multispace sequences and then trim
# export BUILD_DEFAULT_DEPLOY_IGNORE_PATTERN=$(awk '{$1=$1};1' <<<"$MODULE_IGNORE")
# export BUILD_DEFAULT_DEPLOY_IGNORE_PATTERN=$(sed 's/[ ][ ]*/|/g' <<<"$BUILD_DEFAULT_DEPLOY_IGNORE_PATTERN")
# This assumes your build and run values the same, which may not always be the case
# export RUN_DEPLOY_IGNORE_PATTERN="-Ddeploy.ignore.pattern="($BUILD_DEFAULT_DEPLOY_IGNORE_PATTERN)'"

STARTER_MODULES=" \
   gsrs-spring-starter:aw_a25_configlisttomap \
   gsrs-spring-module-substances:aw_sm_a42_configlisttomap \
   gsrs-spring-module-adverse-events:mm_3.1.2 \
   gsrs-spring-module-drug-applications:mm_3.1.2 \
   gsrs-spring-module-clinical-trials:aw_a35_configlisttomap \
   gsrs-spring-module-impurities:mm_a01_configlisttomap \
   gsrs-spring-module-invitro-pharmacology:mm_3.1.2 \
   gsrs-spring-module-drug-products:aw_a02_configlisttomap \
"
#   gsrs-spring-module-ssg4:mm_3.1.2 \

STARTER_MODULES=$(awk '{$1=$1};1' <<<"$STARTER_MODULES")

MODULE_IGNORE="discovery ssg4m"

DEFAULT_DEPLOY_IGNORE_PATTERN="discovery|ssg4m"

USE_SUDO=${USE_SUDO:-''}
PROJECT=${PROJECT:-hocon}
PROGRESS=${PROGRESS:-''}
CACHE=${CACHE:-'--no-cache'}
DEFAULT_IMAGE_NAME=gsrs3i-${PROJECT}:latest
IMAGE_NAME=${IMAGE_NAME:-$DEFAULT_IMAGE_NAME}

$USE_SUDO docker build \
   -f Dockerfile.${PROJECT}.devel \
   --build-arg STARTER_MODULES="${STARTER_MODULES}" \
   --build-arg MODULE_IGNORE="${MODULE_IGNORE}" \
   --build-arg DEFAULT_DEPLOY_IGNORE_PATTERN="${DEFAULT_DEPLOY_IGNORE_PATTERN}" \
   --ulimit nofile=65535:65535 $CACHE $PROGRESS \
   -t ${IMAGE_NAME} .

