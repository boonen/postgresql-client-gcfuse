FROM registry.opensource.zalan.do/acid/spilo-12:1.6-p2
MAINTAINER Jan Boonen <jan.boonen@geodan.nl>

ENV BACKUP_DIR=/backup

RUN echo "deb http://packages.cloud.google.com/apt gcsfuse-bionic main" | tee /etc/apt/sources.list.d/gcsfuse.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    apt-get update && apt-get install -y gcsfuse && \
    mkdir -p $BACKUP_DIR && chown postgres $BACKUP_DIR && \
    rm -rf /var/lib/apt/lists/* /tmp/*

WORKDIR $BACKUP_DIR
USER postgres
ADD docker-entrypoint.sh /docker-entrypoint.sh

CMD ["--help"]
ENTRYPOINT ["/docker-entrypoint.sh"]
