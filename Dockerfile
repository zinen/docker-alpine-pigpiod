# Based on Alpine, a tiny linux distribution
FROM alpine as builder
# Install basic package to compile source code
RUN apk add alpine-sdk
# Follow the install guide from creator of pigpio, http://abyz.me.uk/rpi/pigpio/download.html
RUN wget --output-document=download.zip https://github.com/joan2937/pigpio/archive/v76.zip
# Unzip archive into download folder
RUN mkdir download && unzip -d download download.zip
# Move downloaded files to root of download folder
RUN cd /download/* && mv * ../
# Define workdir for the next steps
WORKDIR /download
# Fix for compiling on Alpine, https://github.com/joan2937/pigpio/issues/107
RUN sed -i -e 's/ldconfig/echo ldconfig disabled/g' Makefile
# Make code
RUN make
# Intall and clean up code base
RUN make install && make clean
# Start of new base image
FROM alpine
LABEL maintainer="zinen@users.noreply.github.com"
COPY --from=builder /usr/local /usr/local
# Copy app into image
COPY start.sh /start.sh
# Give execution permission
RUN chmod +x /start.sh
# Start app
CMD /start.sh
