FROM gliderlabs/alpine:3.2
MAINTAINER Adam Greene <adam.greene@gmail.com>

ENV OAUTH2_PROXY_VERSION 2.1
ENV GO_VERSION go1.6

RUN apk --update add curl

RUN curl -sL -o oauth2_proxy.tar.gz \
    "https://github.com/bitly/oauth2_proxy/releases/download/v$OAUTH2_PROXY_VERSION/oauth2_proxy-$OAUTH2_PROXY_VERSION.linux-amd64.$GO_VERSION.tar.gz" \
  && tar xzvf oauth2_proxy.tar.gz \
  && mv oauth2_proxy-$OAUTH2_PROXY_VERSION.linux-amd64.$GO_VERSION/oauth2_proxy /bin/ \
  && chmod +x /bin/oauth2_proxy \
  && rm -r oauth2_proxy*

ENTRYPOINT ["oauth2_proxy"]
