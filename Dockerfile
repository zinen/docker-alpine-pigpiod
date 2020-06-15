# Based on alpine, a tiny linux distribution
FROM alpine as builder
# Install basic package to compile source code
RUN apk add alpine-sdk
# Follow the install guide from creator of pigpio, http://abyz.me.uk/rpi/pigpio/download.html
RUN wget https://github.com/joan2937/pigpio/archive/master.zip
RUN unzip master.zip
WORKDIR /pigpio-master
# Fix for compiling on alpine, https://github.com/joan2937/pigpio/issues/107
RUN sed -i -e 's/ldconfig/echo ldconfig disabled/g' Makefile
RUN make
RUN make install && make clean
# Start of new base image
FROM alpine
COPY --from=builder /usr/local /usr/local
# Copy and Start app
COPY start.sh /start.sh
CMD ["/start.sh"]
