ARG SHOPWARE_VERSION
ARG PHP_VERSION
ARG MYSQL_VERSION
ARG CONSENT_MANAGER_VERSION
ARG COMPOSER_VERSION
ARG NODE_VERSION

# Check out shopware source
FROM alpine/git:latest AS clone

ARG SHOPWARE_VERSION
RUN git clone https://github.com/shopware/shopware.git /shopware --depth=1 --branch=${SHOPWARE_VERSION}
