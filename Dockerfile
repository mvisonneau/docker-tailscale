FROM alpine:3.15

ARG TARGETARCH
ARG VERSION=1.34.1

RUN \
  apk add --no-cache iptables iproute2 ca-certificates bash \
  && apk add --no-cache --virtual=.install-deps curl tar \
  && curl -sL "https://pkgs.tailscale.com/stable/tailscale_${VERSION}_${TARGETARCH}.tgz" \
  | tar -zxf - -C /usr/local/bin --strip=1 tailscale_${VERSION}_${TARGETARCH}/tailscaled tailscale_${VERSION}_${TARGETARCH}/tailscale \
  && apk del .install-deps

COPY entrypoint /usr/local/bin/entrypoint

ENTRYPOINT ["/usr/local/bin/entrypoint"]
