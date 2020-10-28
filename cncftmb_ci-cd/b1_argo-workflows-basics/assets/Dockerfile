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

## Argo client
ENV ARGO_CLIENT_VERSION="2.11.6"

RUN curl -sLO https://github.com/argoproj/argo/releases/download/v${ARGO_CLIENT_VERSION}/argo-linux-amd64.gz && \
    gunzip argo-linux-amd64.gz && \
    chmod +x argo-linux-amd64 && \
    mv ./argo-linux-amd64 /usr/local/bin/argo && \
    rm -f argo-linux-amd64.gz 

# Minio client
ENV MINIO_CLIENT_VERSION="RELEASE.2020-10-03T02-54-56Z"
ENV MINIO_CLIENT_SHA256="59e184bd4e2c3a8a19837b0f0da3977bd4e301495a24e4a5d50e291728a1de51"

RUN curl -L https://dl.min.io/client/mc/release/linux-amd64/archive/mc.${MINIO_CLIENT_VERSION} -o /usr/local/bin/mc && \
    echo "${MINIO_CLIENT_SHA256} /usr/local/bin/mc | sha256sum --check" && \
    chmod +x /usr/local/bin/mc

# Activate custom user
USER ${USER}
WORKDIR /home/${USER}

CMD ["/bin/bash", "-c", "tail -f /dev/null"]