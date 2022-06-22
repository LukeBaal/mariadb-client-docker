FROM alpine:latest

RUN mkdir /scripts

COPY ./scripts/daily/* /scripts/daily

RUN apk update && \
    apk upgrade && \
    apk add --no-cache mariadb-client && \
    chmod a+x /scripts/daily/*