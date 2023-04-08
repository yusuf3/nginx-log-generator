export ROOT_DIR=${shell pwd}

DEPS_NAME=nginx-log-generator-deps
BUILD_NAME=nginx-log-generator-build

deps: # Install dependencies
	- docker stop ${DEPS_NAME}
	- docker rm ${DEPS_NAME}
	docker run --rm -v ${ROOT_DIR}:/app --name ${DEPS_NAME} -w /app golang:alpine  \
	sh -c  "go mod download"

build: # Build code
	- docker stop ${DEPS_NAME}
	- docker rm ${DEPS_NAME}
	docker run --rm -v ${ROOT_DIR}:/app --name ${DEPS_NAME} -w /app golang:alpine  \
	sh -c  "CGO_ENABLED=0 go build -o /app"
