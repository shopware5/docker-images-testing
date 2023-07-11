CI_REGISTRY_IMAGE ?= local

UPSTREAM_REF_NAME ?= 5.7
UPSTREAM_COMMIT_SHA ?= 00000000
PHP_VERSION ?= 7.4
COMPOSER_VERSION ?= 2
NODE_VERSION ?= 18

running\:%:
	node "twig.js" running/Dockerfile.twig "{\"imageName\": \"$@\"}" > running/Dockerfile
	docker build --progress=plain \
		-t "ghcr.io/shopware5/docker-images-testing/$@" \
		-f ./running/Dockerfile ./running/
		--progress=plain

install\:%:
	node "twig.js" Dockerfile.twig "{\"imageName\": \"$@\"}" > Dockerfile
	docker build \
		-t "ghcr.io/shopware5/docker-images-testing/$@" \
		-f ./Dockerfile ./
		--progress=plain

test\:%:
	docker run -d -p 80:80 "ghcr.io/shopware5/docker-images-testing/install:$*"
	sleep 15s
	curl http://localhost | grep "shopware"

