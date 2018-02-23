FROM node:carbon-alpine

LABEL maintainer="Warren Seymour <warren@fountainhead.tech>"

RUN apk add --no-cache \
  git \
  zip \
  curl \
  jq

RUN apk add --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ \
	moreutils

ADD https://codeclimate.com/downloads/test-reporter/test-reporter-latest-linux-amd64 /usr/local/bin/cc-test-reporter
RUN chmod +x /usr/local/bin/cc-test-reporter

ADD https://raw.githubusercontent.com/cibuilds/chrome-extension/491cdfa8f4011e975178f2129672838423ff4de1/scripts/publish.sh /usr/local/bin/publish
RUN chmod +X /usr/local/bin/publish