#!/bin/bash
#
# Checks if pot available and waits until its available (return true if available)
#
function checkPortAvailable()
{
	local HOST_IP=${1}
	local CHECK_PORT=${2}
	while ! $(nc -z "${HOST_IP}" "${CHECK_PORT}" > /dev/null 2>&1); do
		return 1
	done
	return 0
}

#
# Maps the yaml file (Only one depth permitted)
# to the calling file
#
function mapEnvironment()
{
  local ENV_FILE="${1}"
  local PARAMETER_LIST=$(grep -v ':$' "${ENV_FILE}" | grep -v '^  - ' | cut -d ':' -f1)

  for PARAMETER in ${PARAMETER_LIST}; do
    ## Get parameter value
    local VALUE=$(grep "^${PARAMETER}:" "${ENV_FILE}" | cut -d ':' -f2 | tr -d '\040\011\012\015')
    local VAR=$(echo ${PARAMETER} | awk '{print toupper($0)}')
    export ${VAR}="${VALUE}"
  done
}

mapEnvironment /tmp/environment.yml

RIVER_FILE="/tmp/elasticsearch/river.json"
TWITTER_FILE="/tmp/elasticsearch/mapping.json"
KIBANA_FILE="/tmp/elasticsearch/kibana_mapping.json"
KIBANA_CONFIG="/tmp/elasticsearch/kibana_config.json"

cp "/tmp/elasticsearch/river.json.tpl" "${RIVER_FILE}"

sed -i "s/CONSUMER_KEY/${CONSUMER_KEY}/" ${RIVER_FILE}
sed -i "s/CONSUMER_SECRET/${CONSUMER_SECRET}/" ${RIVER_FILE}
sed -i "s/ACCESS_TOKEN_SECRET/${ACCESS_TOKEN_SECRET}/" ${RIVER_FILE}
sed -i "s/ACCESS_TOKEN/${ACCESS_TOKEN}/" ${RIVER_FILE}


## Waits for elasticsearch port to be available
while ! checkPortAvailable elasticsearch 9200; do
  sleep 0.5
done

curl -s -XPUT -H "Content-Type: application/json" --data @${TWITTER_FILE} \
http://elasticsearch:9200/twitter/

curl -s -XPUT -H "Content-Type: application/json" --data @${KIBANA_FILE} \
http://elasticsearch:9200/.kibana/

curl -s -XPOST -H "Content-Type: application/json" --data @${KIBANA_CONFIG} \
http://elasticsearch:9200/.kibana/config/4.1.0

curl -s -XPOST http://elasticsearch:9200/.kibana/index-pattern/twitter -d '{
	"title": "twitter",
	"timeFieldName": "created_at"
}'

curl -s -H "Content-Type: application/json" --data @${RIVER_FILE} \
http://elasticsearch:9200/_river/twitter/_meta
