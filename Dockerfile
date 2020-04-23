FROM ubuntu:18.04

WORKDIR /src

RUN apt-get update -y && apt-get install -y curl expect jq
RUN mkdir actions-runner && cd actions-runner  && \
    curl -O -L https://github.com/actions/runner/releases/download/v2.169.1/actions-runner-linux-x64-2.169.1.tar.gz && \
    tar xzf ./actions-runner-linux-x64-2.169.1.tar.gz && \
    useradd -m ubuntu && \
    chown -R ubuntu:ubuntu /src

COPY entrypoint /opt/entrypoint

WORKDIR /src/actions-runner

COPY configexpect configexpect

RUN ./bin/installdependencies.sh

USER ubuntu

ENTRYPOINT ["/opt/entrypoint"]
