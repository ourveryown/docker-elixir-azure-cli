OWNER_TEAM = ourveryown
IMAGE_NAME = elixir-azure-cli
DOCKER_ID_USER = ${OWNER_TEAM}
DOCKER_ID_PASS ?= "unknown"

build:
	docker build --tag ${OWNER_TEAM}/${IMAGE_NAME}:latest .
publish: build
	docker login -u ${DOCKER_ID_USER} -p ${DOCKER_ID_PASS}
	docker image push ${OWNER_TEAM}/${IMAGE_NAME}:latest
