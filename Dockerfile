FROM biggis/base:java8-jre-alpine

MAINTAINER wipatrick

# The Scala 2.11 build is currently recommended by the project.
# Once Flink 1.2 is available we can upgrade to 0.10.X
ARG KAFKA_VERSION=0.9.0.0
ARG SCALA_VERSION=2.11

ARG BUILD_DATE
ARG VCS_REF

LABEL eu.biggis-project.build-date=$BUILD_DATE \
      eu.biggis-project.license="MIT" \
      eu.biggis-project.name="BigGIS" \
      eu.biggis-project.url="http://biggis-project.eu/" \
      eu.biggis-project.vcs-ref=$VCS_REF \
      eu.biggis-project.vcs-type="Git" \
      eu.biggis-project.vcs-url="https://github.com/biggis-project/biggis-infrastructure" \
      eu.biggis-project.environment="dev" \
      eu.biggis-project.version=$KAFKA_VERSION

ENV KAFKA_RELEASE_ARCHIVE kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz

RUN set -x && \
    apk --update add --virtual build-dependencies curl && \
    curl -s http://mirror.23media.de/apache/kafka/${KAFKA_VERSION}/${KAFKA_RELEASE_ARCHIVE} | tar -xzf - -C /opt && \
    ln -s /opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION} /opt/kafka && \
    mkdir -p /tmp/kafka /tmp/logs && \
    apk del build-dependencies && \
    rm -rf /var/cache/apk/*

ENV KAFKA_HOME /opt/kafka
ENV PATH $KAFKA_HOME/bin:$PATH

ADD config $KAFKA_HOME/config
ADD start.sh $KAFKA_HOME/start.sh

WORKDIR /opt/kafka

EXPOSE 9092 7203

CMD ["/opt/kafka/start.sh"]
