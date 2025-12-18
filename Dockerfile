FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
    curl \
    wget \
    git \
    vim \
    sudo \
    ca-certificates \
 && rm -rf /var/lib/apt/lists/*

# install ttyd
RUN wget -O /usr/bin/ttyd https://github.com/tsl0922/ttyd/releases/download/1.7.7/ttyd.x86_64 \
 && chmod +x /usr/bin/ttyd

EXPOSE 7681

CMD ["ttyd", "-p", "7681", "bash"]
