# Based on Alpine, a tiny linux distribution
FROM alpine as builder
# Install basic package to compile source code
RUN apk add alpine-sdk
# Follow the install guide from creator of pigpio, http://abyz.me.uk/rpi/pigpio/download.html
RUN wget --output-document=download.zip https://github.com/joan2937/pigpio/archive/master.zip \
# Downloaded content is placed inside specific folder to not be depended of branch naming from repo
    && mkdir download \
    && unzip -d download download.zip \
    && cd /download/* \
# Fix for compiling on Alpine, https://github.com/joan2937/pigpio/issues/107
    && sed -i -e 's/ldconfig/echo ldconfig disabled/g' Makefile \
    && make \
    && make install
# Start of new base image
FROM alpine
# Running pigpiod in foreground then container should request SIGKILL right away and not the default SIGTERM, wait 10 sec., and then SIGKILL. 
STOPSIGNAL SIGKILL
EXPOSE 8888
LABEL maintainer="zinen@users.noreply.github.com"
COPY --from=builder /usr/local /usr/local
# Copy app into image
COPY start.sh /start.sh
# TARGETARCH is filed when building multi-architecture images by buildx
ARG TARGETARCH
# Fix for 64-bit systems as they need other run parameters then 32-bit https://github.com/zinen/docker-alpine-pigpiod/issues/17
RUN if [ "$TARGETARCH" = "arm64" ] ; then sed -i -e 's/pigpiod -g -a 1/pigpiod -g/g' start.sh && echo TARGETARCH arm64; else echo TARGETARCH $TARGETARCH ; fi
# Make sure file has execution permission
RUN chmod +x /start.sh
# Start app
CMD /start.sh
