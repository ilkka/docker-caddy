FROM alpine:3.3
MAINTAINER Ilkka Laukkanen <ilkka@ilkka.io>

RUN apk --no-cache add --virtual build-deps curl

RUN mkdir -p /caddy \
  && curl -L "https://caddyserver.com/download/build?os=linux&arch=386&features=" | tar xzf - -C /caddy

EXPOSE 2015

RUN apk del build-deps

RUN adduser -S -h /caddy caddy \
  && chown -R caddy:nogroup /caddy

USER caddy

WORKDIR /caddy
ONBUILD COPY Caddyfile /caddy/

CMD ["./caddy"]
