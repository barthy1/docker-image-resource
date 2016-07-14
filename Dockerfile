FROM 140.211.168.97:5000/git2.4

RUN rm -rf /var/lib/apt/lists/* && apt-get update \
    && apt-get install -y iptables openssl ssl-cert ca-certificates

RUN cat /etc/ssl/certs/*.pem > /etc/ssl/certs/ca-certificates.crt


ADD scripts/install_jq.sh install_jq.sh
RUN ./install_jq.sh && rm install_jq.sh

ADD docker/ /usr/local/bin/
RUN /usr/local/bin/docker --version

ADD assets/ /opt/resource/
RUN chmod +x /opt/resource/*

#ADD bin/ /bin/
