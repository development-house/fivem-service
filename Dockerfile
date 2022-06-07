FROM purpleworld/alpine-v8:main as v8
FROM centos:latest as libv8
# Migrate from CentOS 8 to CentOS Stream
RUN dnf -y --disablerepo '*' --enablerepo=extras swap centos-linux-repos centos-stream-repos
RUN dnf -y distro-sync
RUN yum -y install epel-release
RUN yum -y module enable nodejs:13
RUN yum -y install v8-devel
FROM alpine:latest
ENV FIVEM_NUM=5562
ENV FIVEM_VER=5562-25984c7003de26d4a222e897a782bb1f22bebedd
RUN apk add --no-cache tini
RUN apk add --no-cache libgcc
RUN apk add --no-cache libstdc++
RUN apk add --no-cache libcurl
COPY --from=v8 /root/v8/include /usr/include
COPY --from=v8 /root/v8/lib /usr/lib
# COPY --from=libv8 /usr/include/cppgc /usr/include/cppgc
COPY --from=libv8 /usr/include/libplatform /usr/include/libplatform
COPY --from=libv8 /usr/include/v8-internal.h /usr/include/v8-internal.h
COPY --from=libv8 /usr/include/v8-platform.h /usr/include/v8-platform.h
COPY --from=libv8 /usr/include/v8-profiler.h /usr/include/v8-profiler.h
COPY --from=libv8 /usr/include/v8-version.h /usr/include/v8-version.h
COPY --from=libv8 /usr/include/v8.h /usr/include/v8.h
COPY --from=libv8 /usr/include/v8config.h /usr/include/v8config.h
COPY --from=libv8 /usr/lib64/libv8.so /usr/lib/libv8.so
COPY --from=libv8 /usr/lib64/libv8_libbase.so /usr/lib/libv8_libbase.so
COPY --from=libv8 /usr/lib64/libv8_libplatform.so /usr/lib/libv8_libplatform.so
WORKDIR /output
RUN wget -O- https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/${FIVEM_VER}/fx.tar.xz \
    | tar xJ --strip-components=1 \
    --exclude alpine/dev --exclude alpine/proc \
    --exclude alpine/run --exclude alpine/sys
WORKDIR /
RUN cp -R /output/opt/cfx-server /opt/cfx-server
RUN mkdir /txData
COPY server.cfg /opt/cfx-server-data/server.cfg
COPY logo.png /opt/cfx-server-data/logo.png
EXPOSE 30120
EXPOSE 40120
VOLUME /opt/cfx-server-data/resources
VOLUME /txData
ENTRYPOINT ["tini", "--"]
CMD ["opt/cfx-server/FXServer"]