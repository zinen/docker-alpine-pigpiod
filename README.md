# docker-alpine-pigpiod [![dockerhub-badge][]][dockerhub]

[dockerhub]:       https://hub.docker.com/r/zinen2/alpine-pigpiod
[dockerhub-badge]: https://img.shields.io/docker/pulls/zinen2/alpine-pigpiod

Docker image containing [pigpiod](http://abyz.me.uk/rpi/pigpio/pigpiod.html) running on port 8888. 
Can be used together with [node-red](https://nodered.org/) to access GPIOs on raspberry pi, by installing the package [node-red-node-pi-gpiod](https://flows.nodered.org/node/node-red-node-pi-gpiod).

Since this Docker image is based on the Linux distribution **alpine**, the image i very small (~6MB).

Usage: `docker run -it -p 8888:8888 --device /dev/gpiochip0 zinen2/alpine-pigpiod`

*This container must be run on a raspberry pi itself, but the GPIO's is accessible for other devices on port 8888.*

### What is pigpiod
**pigpiod** is a Linux daemon that launches the *[pigpio](http://abyz.me.uk/rpi/pigpio/index.html)*. *pigpio* and **pigpiod** is from the same creator.
*pigpio* is a library for the Raspberry which allows control of the General Purpose Input Outputs (GPIO).

## Which tag to use?
As default you should use no tag or `latest`. It should not be necessary to specify the architecture of the board. When pulling an image docker will automatic try to download the right image for you.

But in case docker fails at this the tag below can be used. *I had to specify it to work with [belenaCloud](https://www.balena.io/cloud).*
Eg. for running on raspberry pi (1) this worked for me: `docker run -it -p 8888:8888 --device /dev/gpiochip0 zinen2/alpine-pigpiod:arm32v6`

| Device Name | Docker image tag | Tested?* | [pigpio version tested][pigpio-release] |
| --- | --- | --- | --- |
| Raspberry Pi (1, Zero, Zero W) | zinen2/alpine-pigpiod:arm32v6 | ✔ yes, works on rpi1 | 76 |
| Raspberry Pi 2 | zinen2/alpine-pigpiod:arm32v7 | ☐ no | NA |
| Raspberry Pi 3 (32bit) | zinen2/alpine-pigpiod:arm32v7 | ✔ yes, works | 76, 78 |
| Raspberry Pi 3 (64bit) | zinen2/alpine-pigpiod:arm64v8 | ❌ [yes but don't work][64-issue] | 76 |
| Raspberry Pi 4 | zinen2/alpine-pigpiod:arm64v8 | ☐ no | NA |

Some problems can also be fixed by running the container privileged. In that case you can try this `docker run -it -p 8888:8888 --privileged zinen2/alpine-pigpiod`

\**If you test it on your hardware, please respond back if it worked. By issue or pull request.*

### Specific version
It is possible to pull a specific version via. eg. `docker pull zinen2/alpine-pigpiod:pigpio-v78` for pulling version 78. See list of tags available on docker hub.  

### Updates of images
The images are automatic updated when a new release of pigpio is posted at [github releases][pigpio-release].

[64-issue]: https://github.com/joan2937/pigpio/issues/362
[pigpio-release]: https://github.com/joan2937/pigpio/releases
## Credits
`start.sh` is a copy from another project and the creator’s repo is [found here](https://github.com/janvda/balena-node-red).
