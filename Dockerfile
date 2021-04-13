FROM alpine:latest as build

WORKDIR /vlmcsd

COPY ./ /vlmcsd/

RUN apk add --no-cache git make build-base && \
    cd /vlmcsd/ && \
    make

FROM alpine:latest
COPY --from=build /vlmcsd/bin/vlmcsd /usr/local/bin/vlmcsd
ENTRYPOINT ["vlmcsd"]