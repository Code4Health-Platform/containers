# Dockerfile for Marand Think!EHR Explorer

FROM tomcat:8-alpine

LABEL Vendor="Inidus" \
      License=Apache \
      Version=0.0.3 \
      Maintainer="Inidus <cloud-ops@inidus.io>"

# Docker - Set ARG to be used in the build
ARG EXPLORER_ZIP

# Docker - Set ENV to be used in the build
ENV EXPLORER_ZIP=$EXPLORER_ZIP \
    EXPLORER_PATH=/opt/explorer \
    EXPLORER_WAR=explorer.war

# Inidus - Install Think!EHR Explorer
COPY ./source/${EXPLORER_ZIP} /tmp/${EXPLORER_ZIP}

# Install Think!EHR Explorer
RUN mkdir -p ${EXPLORER_PATH} && \
    apk add --update unzip && \
    unzip /tmp/${EXPLORER_ZIP} -d ${EXPLORER_PATH} && \
    ln -s ${EXPLORER_PATH}/explorer4.war /usr/local/tomcat/webapps/${EXPLORER_WAR} && \
    apk del unzip && \
    rm -rf /tmp/* /var/cache/apk/*

EXPOSE 8080

CMD ["catalina.sh", "run"]
