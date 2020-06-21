FROM mhart/alpine-node:10
LABEL maintainer="hans_meine@gmx.net"

RUN apk --update add git

RUN git clone https://github.com/novnc/noVNC.git /app \
 && git clone https://github.com/novnc/websockify /app/utils/websockify \
 && rm -rf /app/.git /app/utils/websockify/.git
RUN cd /app && npm install 
RUN cd /app && ./utils/use_require.js --as commonjs --with-app

# ---------------------------------------------------------------------------------

FROM mhart/alpine-node:slim-10
LABEL maintainer="hans_meine@gmx.net"

RUN apk add --no-cache tini python

ARG BUILD_VCS_REV

LABEL org.opencontainers.image.title="NoVNC"
LABEL org.opencontainers.image.description="Size-optimized NoVNC image (web-based VNC client)"
LABEL org.opencontainers.image.authors="hans_meine@gmx.net"

LABEL org.opencontainers.image.source="https://github.com/novnc/noVNC"
LABEL org.opencontainers.image.licenses="MPL-2.0"
LABEL org.opencontainers.image.revision=$BUILD_VCS_REV

# don't know how to implement with Docker Hub; also, build time is not crucial
# and still visible through docker history:
#ARG BUILD_TIMESTAMP
#LABEL org.opencontainers.image.created=$BUILD_TIMESTAMP

ENV REMOTE_HOST=localhost
ENV REMOTE_PORT=5900

COPY --from=0 /app /app

COPY start.sh /app/start.sh

# the web server (websockify) should not display a directory listing:
RUN ln /app/build/vnc.html /app/build/index.html

EXPOSE 80

ENTRYPOINT ["/sbin/tini", "--", "/app/start.sh"]
