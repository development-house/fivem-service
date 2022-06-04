ARG FIVEM_NUM=5562
ARG FIVEM_VER=5562-25984c7003de26d4a222e897a782bb1f22bebedd

FROM alpine:latest as build
ARG FIVEM_VER

WORKDIR /output

RUN wget -O- https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/${FIVEM_VER}/fx.tar.xz \
    | tar xJ --strip-components=1 \
    --exclude alpine/dev --exclude alpine/proc \
    --exclude alpine/run --exclude alpine/sys \
    && mkdir -p /output/opt/cfx-server-data/resources /output/usr/local/share /txData \
    && apk -p $PWD add tini

FROM scratch
ENV TINI_VERSION v0.19.0
COPY --from=build /output/ /
COPY server.cfg /opt/cfx-server-data/server.cfg
COPY logo.png /opt/cfx-server-data/logo.png
EXPOSE 30120
EXPOSE 40120
VOLUME /opt/cfx-server-data/resources
VOLUME /txData
ENTRYPOINT ["tini", "--"]
CMD ["opt/cfx-server/FXServer"]