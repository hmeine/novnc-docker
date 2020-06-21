# Tiny NoVNC Image

This repository contains a Dockerfile for a size-optimized NoVNC image.

NoVNC is started through Node.js and websockify on the exposed port 80,
which can be mapped to other ports via docker as desired.

The remote VNC server to connect to is specified via the environment variable
`REMOTE_ADDR="hostname:port"`.
Alternatively, the environment variables `REMOTE_HOST` and `REMOTE_PORT` may be used.

I am using a docker hub automated build in order to build this image; the idea was
that it may be more trustful than builds from my own machine. Hence, it is mandatory
to set the `BUILD_VCS_REV` for building, and tagged build available at
https://hub.docker.com/r/hansmeine/novnc reflect the corresponding git revision
from https://github.com/novnc/noVNC

This tiny repo is licensed under the MPL-2.0 (same as NoVNC).
Pull requests welcome at https://github.com/hmeine/novnc-docker

Credits also go to "dougw" who published https://hub.docker.com/r/dougw/novnc
which I used as an inspiration for the image content.
