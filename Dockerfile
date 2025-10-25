FROM ubuntu:24.04@sha256:d22e4fb389065efa4a61bb36416768698ef6d955fe8a7e0cdb3cd6de80fa7eec

RUN apt update && \
  apt install -y --no-install-recommends \
    ca-certificates \
    curl \
    dnsutils \
    gpg \
    netcat-openbsd \
    vim && \
  apt clean && \
  rm -rf /var/lib/apt/lists/*

RUN update-ca-certificates

RUN curl -SsL https://packages.httpie.io/deb/KEY.gpg | gpg --dearmor -o /usr/share/keyrings/httpie.gpg && \
  echo "deb [arch=amd64 signed-by=/usr/share/keyrings/httpie.gpg] https://packages.httpie.io/deb ./" | tee /etc/apt/sources.list.d/httpie.list > /dev/null && \
  apt update && \
  apt install -y --no-install-recommends \
    httpie && \
  apt clean && \
  rm -rf /var/lib/apt/lists/*
