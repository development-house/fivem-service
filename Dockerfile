FROM alpine:latest as build
ENV FIVEM_NUM=5562
ENV FIVEM_VER=5562-25984c7003de26d4a222e897a782bb1f22bebedd
RUN apk add --no-cache tini
RUN apk add --no-cache libgcc
RUN apk add --no-cache libstdc++
RUN apk add --no-cache libcurl
RUN apk add --no-cache git
WORKDIR /output
RUN wget -O- https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/${FIVEM_VER}/fx.tar.xz \
    | tar xJ --strip-components=1 \
    --exclude alpine/dev --exclude alpine/proc \
    --exclude alpine/run --exclude alpine/sys
WORKDIR /
RUN cp -R /output/opt/cfx-server /opt/cfx-server
RUN cp -R /output/usr/* /usr/
RUN mkdir /txData
COPY server.cfg /opt/cfx-server-data/server.cfg
COPY logo.png /opt/cfx-server-data/logo.png
EXPOSE 30125
EXPOSE 30125/udp
EXPOSE 40120
VOLUME /txData
ENTRYPOINT ["tini", "--"]
CMD ["opt/cfx-server/FXServer"]
