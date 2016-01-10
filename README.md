# Docker base image for Caddy

This image can be used to run the [Caddy HTTP/2 web server](https://caddyserver.com) in a container. Just put a Dockerfile next to your Caddyfile with

```
FROM ilkka/caddy:0.8
MAINTAINER You
```

and you're off to the races. The image is set to expose the default Caddy port 2015.

The image tags try to follow Caddy versioning, inasmuch as I'm able to keep up with it, but do ping me if I miss a release.
