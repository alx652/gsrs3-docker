
ENTITIES=${ENTITIES:-"adverseeventpt applications clinicaltrialsus impurities substances"}
for entity in $ENTITIES; do echo ${entity}": "$(curl -s https://gsrs-dev-public.ncats.io/ginas/app/api/v1/${entity}/@count); done

