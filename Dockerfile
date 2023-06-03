FROM alpine:3.18.0

RUN set -e\
 && apk update --no-cache\
 && apk upgrade --no-cache\
 && apk add --no-cache bash curl wget busybox-extras python3 py3-yaml\
 && mkdir -p /fly/conf /fly/hook /fly/over /fly/pack /var/fly/pack

WORKDIR /var/fly/pack

ENTRYPOINT ["bash"]
