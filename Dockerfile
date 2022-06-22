FROM alpine:latest

RUN mkdir -p /scripts/daily

COPY ./scripts/daily/* /scripts/daily

RUN apk update && \
    apk upgrade && \
    apk add --no-cache mariadb-client && \
    chmod a+x /scripts/daily/*