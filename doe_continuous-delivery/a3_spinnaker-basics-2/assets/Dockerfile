FROM amd64/ubuntu:bionic

LABEL maintainer="Florian JUDITH <f.judith@groupeonepoint.com>" \
      contributor="idir TIR <i.tir@groupeonepoint.com>" \
      project="DevOps Enthusiastic" \
      session="Continuous Delivery" \
      version="1.1.0"

ENV LANG=C.UTF-8 \
    USER="sysops" \
    USERID="1001" \
    GROUP="sysops" \
    GROUPID="1001"

# Create custom user
RUN groupadd --gid ${GROUPID} ${GROUP} && \
    useradd --uid ${USERID} --gid ${GROUPID} --shell /bin/bash --create-home ${USER}

RUN apt-get update --yes && \
    apt-get install --yes \
    software-properties-common \
    unzip \
    vim\
    nano \
    iputils-ping \
    ssh \
    curl \
    httpie \
    jq \
    git && \
    apt-get autoremove -y --purge && \
    apt-get clean && \
    rm -r /var/lib/apt/lists/*

# Ansible
RUN apt-add-repository --yes --update ppa:ansible/ansible && \
    apt update --yes && \
    apt-get install --yes \
    ansible && \
    apt-get autoremove -y --purge && \
    apt-get clean && \
    rm -r /var/lib/apt/lists/*

WORKDIR /opt

# Terraform
ENV TERRAFORM_VERSION="0.11.14" \
    TERRAFORM_SHA256=9b9a4492738c69077b079e595f5b2a9ef1bc4e8fb5596610f69a6f322a8af8dd

RUN curl -sLO https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    echo "${TERRAFORM_SHA256} terraform_${TERRAFORM_VERSION}_linux_amd64.zip | sha256sum --check" && \
    unzip -o terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d terraform_${TERRAFORM_VERSION}_linux_amd64 && \
    rm -f terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    if cmp -s /usr/local/bin/terraform terraform_${TERRAFORM_VERSION}_linux_amd64/terraform; then \
      echo "Terraform  ${TERRAFORM_VERSION} already installed !"; \
    else \
      ln -sf $(pwd)/terraform_${TERRAFORM_VERSION}_linux_amd64/terraform /usr/local/bin/terraform;\
    fi

# Concourse (client only)
ENV CONCOURSE_FLY_VERSION="6.6.0" \
    CONCOURSE_FLY_SHA1=3b5f4a3b3aba8f9e4a3f3ff05c4edeace1de539b

RUN curl -sLO https://github.com/concourse/concourse/releases/download/v${CONCOURSE_FLY_VERSION}/fly-${CONCOURSE_FLY_VERSION}-linux-amd64.tgz && \
    echo "${CONCOURSE_FLY_SHA1} fly-${CONCOURSE_FLY_VERSION}-linux-amd64.tgz | sha1sum --check" && \
    tar -xvzf fly-${CONCOURSE_FLY_VERSION}-linux-amd64.tgz && \
    rm -f fly-${CONCOURSE_FLY_VERSION}-linux-amd64.tgz && \
    if cmp -s /usr/local/bin/fly ./fly; then \
      echo "Concourse Fly ${CONCOURSE_FLY_VERSION} already installed !"; \
    else \
      ln -sf $(pwd)/fly /usr/local/bin/fly;\
    fi

# Argo workflow (client only)
ENV ARGO_VERSION="2.11.6"

RUN curl -sLO https://github.com/argoproj/argo/releases/download/v${ARGO_VERSION}/argo-linux-amd64.gz && \
    gunzip argo-linux-amd64.gz && \
    rm -f argo-linux-amd64.gz && \
    chmod +x argo-linux-amd64 && \
    if cmp -s /usr/local/bin/argo ./argo-darwin-amd64; then \
      echo "Argo ${ARGO_VERSION} already installed !"; \
    else \
      ln -sf $(pwd)/argo-linux-amd64 /usr/local/bin/argo;\
    fi

# Show version of external binairy releases
RUN ansible --version && \
    terraform version && \
    fly --version 

RUN mkdir -p /root/.ssh
COPY .ssh/id_rsa /root/.ssh/
COPY .ssh/id_rsa.pub /root/.ssh/
RUN chmod 600 /root/.ssh/id_rsa

EXPOSE 80 8080

USER ${USER}
WORKDIR /home/${USER}

CMD ["/bin/bash", "-c", "tail -f /dev/null"]