ARG FIVEM_NUM=5562
ARG FIVEM_VER=5562-25984c7003de26d4a222e897a782bb1f22bebedd

FROM alpine:latest as build
ARG FIVEM_VER

WORKDIR /output

RUN wget -O- https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/${FIVEM_VER}/fx.tar.xz \
    | tar xJ --strip-components=1 \
    --exclude alpine/dev --exclude alpine/proc \
    --exclude alpine/run --exclude alpine/sys \
    && mkdir -p /output/opt/cfx-server-data/resources /output/usr/local/share \
    && apk -p $PWD add tini
COPY ./server.cfg opt/cfx-server-data
COPY ./logo.png opt/cfx-server-data
COPY entrypoint usr/bin/entrypoint
RUN chmod +x /output/usr/bin/entrypoint


FROM scratch

COPY --from=build /output/ /
WORKDIR /config
EXPOSE 30120
# Default to an empty CMD, so we can use it to add seperate args to the binary
CMD [""]
ENTRYPOINT ["/sbin/tini", "--", "/usr/bin/entrypoint"]
VOLUME /opt/cfx-server-data/resources