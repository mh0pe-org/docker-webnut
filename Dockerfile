# syntax=docker/dockerfile:1
FROM python:3-alpine3.16

LABEL maintainer=edgd1er@hotmail.com
EXPOSE 6543
HEALTHCHECK CMD curl --fail http://localhost:6543 | grep webNUT || exit 1     

WORKDIR /app/
#hadolint ignore=DL3018
RUN apk add --no-cache bash git curl \
    && git clone https://github.com/mh0pe/webNUT.git \
    && pip install --no-cache-dir -e webNUT

COPY /docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
