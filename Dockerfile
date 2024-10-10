FROM jenkins/inbound-agent:latest-alpine
ENV TERRAFORM_VERSION=1.9.7
ENV TERRAFORM_SHA256SUM=76a77ed7e785ef354b7f565abaa990e3e7b5232d3ec4afb87e0f5a413fcbdad1
USER root

RUN apk add --update make git curl curl-dev openssh wget && \
    curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip > terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    echo "${TERRAFORM_SHA256SUM}  terraform_${TERRAFORM_VERSION}_linux_amd64.zip" > terraform_${TERRAFORM_VERSION}_SHA256SUMS && \
    sha256sum -cs terraform_${TERRAFORM_VERSION}_SHA256SUMS && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /bin && \
    rm -f terraform_${TERRAFORM_VERSION}_linux_amd64.zip 
USER root

    curl -L -o /bin/terragrunt https://github.com/gruntwork-io/terragrunt/releases/download/v0.68.1/terragrunt_linux_amd64 \
    chmod u+x  /bin/terragrunt

