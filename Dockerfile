FROM alpine:3.3
MAINTAINER Ilkka Laukkanen <ilkka@ilkka.io>

RUN apk --no-cache add --virtual build-deps curl
RUN mkdir -p /caddy

ENV CADDY_VERSION "0.8.0"
RUN curl -L "https://github.com/mholt/caddy/releases/download/v${CADDY_VERSION}/caddy_linux_amd64.tar.gz" | tar xzf - -C /caddy

EXPOSE 2015

RUN apk del build-deps

RUN adduser -S -h /caddy caddy \
  && chown -R caddy:nogroup /caddy

USER caddy

WORKDIR /caddy
ONBUILD COPY Caddyfile /caddy/

CMD ["./caddy"]
