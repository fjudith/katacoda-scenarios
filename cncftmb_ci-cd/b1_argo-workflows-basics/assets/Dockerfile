FROM amd64/alpine:3

LABEL maintainer="Florian JUDITH <florian.judith.b@gmail.com>" \
      project="CNCF Trailmap" \
      session="CI/CD" \
      version="1.0.0"

ENV LANG=C.UTF-8 \
    USER="sysops" \
    USERID="10001" \
    GROUP="sysops" \
    GROUPID="10001"

# Create custom user
RUN addgroup -g ${GROUPID} ${GROUP} && \
    adduser  -G ${GROUP} -u ${USERID} -s /bin/bash -S ${USER}

RUN apk add --no-cache curl bash git wget

# Activate custom user
USER ${USER}
WORKDIR /home/${USER}

CMD ["/bin/bash", "-c", "tail -f /dev/null"]