# docker-alpine-pigpiod
Base for docker image containing [pigpiod](http://abyz.me.uk/rpi/pigpio/pigpiod.html) running on port 8888. 
Can be used togeter with [node-red](https://nodered.org/) to access GPIO's on raspberry pi. by installing package [node-red-node-pi-gpiod](https://flows.nodered.org/node/node-red-node-pi-gpiod)

Since this docker image is based on the linix distribution **alpine**, the image i very small (~6MB).

Usage: `docker run -it -p 8888:8888 zinen2/alpine-pigpiod`
*Must be run on a raspberry pi itslef, but the GPIO's is avalible on LAN*

### What is pigpiod
**pigpiod** is a linux deamon that launches the *[pigpio](http://abyz.me.uk/rpi/pigpio/index.html)*. *pigpio* and **pigpiod** is from the same creator.
*pigpio* is a library for the Raspberry which allows control of the General Purpose Input Outputs (GPIO).
