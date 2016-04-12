FROM 140.211.168.166:5000/git2.4

RUN rm -rf /var/lib/apt/lists/* && apt-get update
RUN apt-get install -y iptables
RUN apt-get install -y openssl ssl-cert

RUN for cert in `ls -1 /etc/ssl/certs/*.pem`; \
      do cat "$cert" >> /etc/ssl/certs/ca-certificates.crt; \
    done

ADD scripts/install_jq.sh install_jq.sh
RUN ./install_jq.sh && rm install_jq.sh

ADD scripts/install_docker.sh install_docker.sh
RUN ./install_docker.sh && rm install_docker.sh

#RUN /usr/local/bin/docker --version

ADD assets/ /opt/resource/
RUN chmod +x /opt/resource/*

ADD bin/ /bin/
