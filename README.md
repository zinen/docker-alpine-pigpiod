# docker-alpine-pigpiod 

[![Docker Pulls](https://img.shields.io/docker/pulls/zinen2/alpine-pigpiod)](https://hub.docker.com/r/zinen2/alpine-pigpiod)
[![Docker Image Size (latest by date)](https://img.shields.io/docker/image-size/zinen2/alpine-pigpiod)](https://hub.docker.com/r/zinen2/alpine-pigpiod)
[![GitHub release (latest by date)](https://img.shields.io/github/v/release/joan2937/pigpio?label=pigpio)][pigpio-release]
![Docker hub auto publish image](https://github.com/zinen/docker-alpine-pigpiod/workflows/Docker%20hub%20auto%20publish%20image/badge.svg)

Docker image containing [pigpiod](http://abyz.me.uk/rpi/pigpio/pigpiod.html). 
Can e.g. be used with [node-red](https://nodered.org/) to access GPIOs on a Raspberry Pi by installing the package [node-red-node-pi-gpiod](https://flows.nodered.org/node/node-red-node-pi-gpiod).

Since this Docker image is based on the Linux distribution **alpine**, the image i very small (~6MB).

Usage(32bit system): 

`docker run -it -p 8888:8888 --device /dev/gpiochip0 zinen2/alpine-pigpiod`

On 64bit system or if you hit access problems try running privileged: 

`docker run -it -p 8888:8888 --privileged zinen2/alpine-pigpiod`

*Note that this container must run on the Raspberry Pi itself. But the GPIOs is accessible for other devices on the network at port 8888.*

### What is pigpiod
**pigpiod** is a Linux daemon that launches *[pigpio](http://abyz.me.uk/rpi/pigpio/index.html)*. *pigpio* and **pigpiod** is from the same creator.
*pigpio* is a library for the Raspberry Pi which allows control of the General Purpose Input Outputs (GPIO).

## Which tag to use?
As default you should use no tag or `latest`. It should not be necessary to specify the architecture of the board. When pulling an image docker will automatic try to download the right image for you.

But in case docker fails at this the tags below can be used. *I had to specify it to work with [belenaCloud](https://www.balena.io/cloud).*
E.g. for running on Raspberry Pi 1 this worked for me: `docker run -it -p 8888:8888 --device /dev/gpiochip0 zinen2/alpine-pigpiod:arm32v6`

| Device Name | Docker image tag | Tested?* ✔/❌| [pigpio version tested][pigpio-release] |
| --- | --- | --- | --- |
| Raspberry Pi (1, Zero, Zero W) | zinen2/alpine-pigpiod:arm32v6 | ✔ yes, works on rpi1 | 76 |
| Raspberry Pi 2 | zinen2/alpine-pigpiod:latest | ✔ yes, works #19 | 79 |
| Raspberry Pi 3 (32bit) | zinen2/alpine-pigpiod:latest | ✔ yes, works | 76, 78 |
| Raspberry Pi 3 (64bit) | zinen2/alpine-pigpiod:latest | ✔ yes, works | 78 |
| Raspberry Pi 4 | zinen2/alpine-pigpiod:latest | ✔ yes, works | 78 |

Some problems can also be fixed by running the container privileged. In that case you can try this `docker run -it -p 8888:8888 --privileged zinen2/alpine-pigpiod`

\**If you test it on your hardware, please respond back if it worked. By issue or pull request to update the list above.*

### Specific version
It is possible to pull a specific version via. eg. `docker pull zinen2/alpine-pigpiod:pigpio-v78` for pulling version 78. See list of tags available on [docker hub](https://hub.docker.com/repository/docker/zinen2/alpine-pigpiod/tags).  

### Updates of images
The images are automatic updated when a new release of pigpio is posted at [github releases][pigpio-release].

[64-issue]: https://github.com/joan2937/pigpio/issues/362
[pigpio-release]: https://github.com/joan2937/pigpio/releases

## Credits
`start.sh` is mostly a copy from another project and the creator’s repo is [found here](https://github.com/janvda/balena-node-red).

## Reduce CPU usage
Adding the argument `-s 10` will almost half the CPU usage as per [this topic](https://github.com/joan2937/pigpio/issues/29#issuecomment-151076670). But this is not the default behavior and will have some disadvantages as well. Read more about this on the link. 

### Usage for docker command:

32bit OS: `docker run zinen2/alpine-pigpiod pigpiod -g -a 1 -s 10`. 

64bit OS: `docker run zinen2/alpine-pigpiod pigpiod -g -s 10`. 

### Usage inside docker-compose.yml

Add this to your file, 32bit OS:

```yaml
    command: pigpiod -g -a 1 -s 10 # For 32 bits
    command: pigpiod -g -s 10 # For 64 bits
```
