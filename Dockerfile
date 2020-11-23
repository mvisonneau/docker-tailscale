FROM alpine:3.12

ARG VERSION=1.2.8
ARG ARCH=amd64

RUN \
  apk add --no-cache iptables iproute2 ca-certificates \
  && apk add --no-cache --virtual=.install-deps curl tar \
  && curl -sL "https://pkgs.tailscale.com/stable/tailscale_${VERSION}_${ARCH}.tgz" \
     | tar -zxf - -C /usr/local/bin --strip=1 tailscale_${VERSION}_${ARCH}/tailscaled tailscale_${VERSION}_${ARCH}/tailscale \
  && apk del .install-deps

COPY entrypoint /usr/local/bin/entrypoint

ENTRYPOINT ["/usr/local/bin/entrypoint"]