# Tiny NoVNC Image

This repository contains a Dockerfile for a size-optimized NoVNC image.

NoVNC is started through Node.js and websockify on the exposed port 80,
which can be mapped to other ports via docker as desired.

The remote VNC server to connect to is specified via the environment variable
`REMOTE_ADDR="hostname:port"`.
Alternatively, the environment variables `REMOTE_HOST` and `REMOTE_PORT` may be used.

This tiny repo is licensed under the MPL-2.0 (same as NoVNC). Pull requests welcome at https://github.com/hmeine/novnc-docker