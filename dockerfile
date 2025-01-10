FROM ubuntu:latest

EXPOSE 43443/udp
RUN apt-get update && apt-get -y install libicu-dev

COPY librelancer-2024.06.3-ubuntu-amd64 /usr/local/bin/librelancer-2024.06.3-ubuntu-amd64
COPY librelancer.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/librelancer.sh

WORKDIR /usr/local/bin/

CMD ["/bin/bash", "/usr/local/bin/librelancer.sh"]
