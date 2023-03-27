CI_REGISTRY_IMAGE ?= local

UPSTREAM_REF_NAME ?= 5.7
UPSTREAM_COMMIT_SHA ?= 00000000
PHP_VERSION ?= 7.4
COMPOSER_VERSION ?= 2
NODE_VERSION ?= 18

running\:%:
	node "twig.js" running/Dockerfile.twig "{\"imageName\": \"$@\"}" > running/Dockerfile
	docker build --progress=plain \
		-t "${CI_REGISTRY_IMAGE}/$@" \
		-f ./running/Dockerfile ./running/
		--progress=plain

install\:%:
	node "twig.js" Dockerfile.twig "{\"imageName\": \"$@\"}" > Dockerfile
	docker build \
		-t "${CI_REGISTRY_IMAGE}/$@" \
		-f ./Dockerfile ./
		--progress=plain
aio:
	docker build \
		--secret id=UPSTREAM_REPOSITORY_URL \
		--build-arg UPSTREAM_REF_NAME="${UPSTREAM_REF_NAME}" \
		--build-arg UPSTREAM_COMMIT_SHA="${UPSTREAM_COMMIT_SHA}" \
		--build-arg PHP_VERSION="${PHP_VERSION}" \
		--build-arg COMPOSER_VERSION="${COMPOSER_VERSION}" \
		--build-arg NODE_VERSION="${NODE_VERSION}" \
		-t "${CI_REGISTRY_IMAGE}/$@:latest" \
		-t "${CI_REGISTRY_IMAGE}/$@:${UPSTREAM_REF_NAME}" \
		-t "${CI_REGISTRY_IMAGE}/$@:${UPSTREAM_COMMIT_SHA}" \
		-f aio/Dockerfile ./aio/

package-builder-cli\:%:
	docker build \
		-t ${CI_REGISTRY_IMAGE}/package-testsuite/$@ \
		-f package-testsuite/php-builder-cli/Dockerfile .

package-testsuite:
	docker build \
		-t ${CI_REGISTRY_IMAGE}/package-testsuite/php-apache:7.4 \
		-f package-testsuite/php-apache/Dockerfile package-testsuite/php-apache

.PHONY: runnig package-builder-cli package-testsuite aio
