# docker-alpine-pigpiod
Base for Docker image containing [pigpiod](http://abyz.me.uk/rpi/pigpio/pigpiod.html) running on port 8888. 
Can be used together with [node-red](https://nodered.org/) to access GPIO's on raspberry pi. by installing package [node-red-node-pi-gpiod](https://flows.nodered.org/node/node-red-node-pi-gpiod)

Since this Docker image is based on the Linux distribution **alpine**, the image i very small (~6MB).

Usage: `docker run -it -p 8888:8888 zinen2/alpine-pigpiod`
*This container must be run on a raspberry pi itself, but the GPIO's is usable on port 8888 on LAN*

### What is pigpiod
**pigpiod** is a Linux deamon that launches the *[pigpio](http://abyz.me.uk/rpi/pigpio/index.html)*. *pigpio* and **pigpiod** is from the same creator.
*pigpio* is a library for the Raspberry which allows control of the General Purpose Input Outputs (GPIO).

## Credits
`start.sh` is a copy from another project and the creator’s repo is [found here](https://github.com/janvda/balena-node-red).
