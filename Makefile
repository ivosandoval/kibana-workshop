PARAMETERS = elasticsearch/request.json.tpl
COMPONENT ?= kibana-workshop
VERSION ?= $(shell cat VERSION)

all: dev logs

dev:
	@docker-compose -p ${COMPONENT} -f docker-compose.yml up -d

kill:
	@docker-compose -p ${COMPONENT} -f docker-compose.yml kill

load:
	@curl -XPOST dev.wellhello.com:19200/_bulk --data-binary @elasticsearch/content.json; echo

nodev:
	@docker-compose -p ${COMPONENT} -f docker-compose.yml kill
	@docker-compose -p ${COMPONENT} -f docker-compose.yml rm -f
	@rm -f elasticsearch/river.json

logs:
	@docker-compose -p ${COMPONENT} -f docker-compose.yml logs

tag:
	@git tag -l | sort -r |head -1

.PHONY: test docs
