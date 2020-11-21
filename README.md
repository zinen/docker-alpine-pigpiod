# docker-alpine-pigpiod [![dockerhub-badge][]][dockerhub]

[dockerhub]:       https://hub.docker.com/r/zinen2/alpine-pigpiod
[dockerhub-badge]: https://img.shields.io/docker/pulls/zinen2/alpine-pigpiod

Docker image containing [pigpiod](http://abyz.me.uk/rpi/pigpio/pigpiod.html) running on port 8888. 
Can be used together with [node-red](https://nodered.org/) to access GPIOs on raspberry pi. by installing package [node-red-node-pi-gpiod](https://flows.nodered.org/node/node-red-node-pi-gpiod)

Since this Docker image is based on the Linux distribution **alpine**, the image i very small (~6MB).

Usage: `docker run -it -p 8888:8888 --privileged zinen2/alpine-pigpiod`
or using a tagged image, eg. `docker run -it -p 8888:8888 --privileged zinen2/alpine-pigpiod:arm32v6`

*This container must be run on a raspberry pi itself, but the GPIO's is accessible for other devices on port 8888*

### What is pigpiod
**pigpiod** is a Linux daemon that launches the *[pigpio](http://abyz.me.uk/rpi/pigpio/index.html)*. *pigpio* and **pigpiod** is from the same creator.
*pigpio* is a library for the Raspberry which allows control of the General Purpose Input Outputs (GPIO).

## Which tag to use?
It should not be necessary to specify the architecture of the board, but just in case thees are here. I had to specify it to work with [belenaCloud](https://www.balena.io/cloud).
| Device Name | Docker image tag | Tested?* | [Version tested][pigpio-realease] |
| --- | --- | --- | --- |
| Raspberry Pi (1, Zero, Zero W) | zinen2/alpine-pigpiod:arm32v6 | :heavy_check_mark: yes, works on rpi1 | 76 |
| Raspberry Pi 2 | zinen2/alpine-pigpiod:arm32v7 | :black_square_button: no | NA |
| Raspberry Pi 3 (32bit) | zinen2/alpine-pigpiod:arm32v7 | :heavy_check_mark: yes, works | 76 |
| Raspberry Pi 3 (64bit) | zinen2/alpine-pigpiod:arm64v8 | :x: [yes but don't work][64-issue] | 76 |
| Raspberry Pi 4 | zinen2/alpine-pigpiod:arm64v8 | :black_square_button: no | NA |

\**If you test it on your hardware, please respond back if it worked.*

[64-issue]: https://github.com/joan2937/pigpio/issues/362
[pigpio-realease]: https://github.com/joan2937/pigpio/releases

## Credits
`start.sh` is a copy from another project and the creator’s repo is [found here](https://github.com/janvda/balena-node-red).
