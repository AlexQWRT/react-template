FROM node:19.3-alpine3.17

ARG HOST_UID=1000

RUN apk add bash \
      curl \
      shadow \
    && usermod -u "${HOST_UID}" node \
    && groupmod -g "${HOST_UID}" node  \
    && /usr/bin/install -m 0775 -o node -g node -d /app

WORKDIR /app