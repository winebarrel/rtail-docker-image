FROM mhart/alpine-node

ENV RTAIL_UDP_HOST 0.0.0.0
ENV RTAIL_UDP_PORT 9999
ENV RTAIL_WEB_HOST 0.0.0.0
ENV RTAIL_WEB_PORT 8888

ENV DUMB_INIT_VERSION 1.2.0

RUN apk update && \
    apk add ca-certificates wget && \
    wget -q -O /usr/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64 && \
    chmod +x /usr/bin/dumb-init && \
    npm install -g --production --no-progress rtail

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD exec \
  rtail-server \
    --udp-host $RTAIL_UDP_HOST \
    --udp-port $RTAIL_UDP_PORT \
    --web-host $RTAIL_WEB_HOST \
    --web-port $RTAIL_WEB_PORT
