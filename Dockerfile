FROM alpine:edge

ARG AUUID="06b9cbc3-6d0c-457c-905e-c3d5baa72e7b"
ARG CADDYIndexPage="https://github.com/AYJCSGM/mikutap/archive/master.zip"
ARG ParameterSSENCYPT="chacha20-ietf-poly1305"
ARG PORT=8080

ADD etc/Caddyfile /tmp/Caddyfile
ADD etc/xray.json /tmp/xray.json
ADD deploy.sh /deploy.sh
ADD start.sh /start.sh

RUN apk update && \
    apk add --no-cache ca-certificates bash caddy  unzip wget && \
    bash deploy.sh

RUN chmod +x /start.sh

CMD /start.sh
