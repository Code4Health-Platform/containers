# Dockerfile for Marand Think!EHR Explorer

FROM tomcat:8-alpine

LABEL Vendor="Inidus" \
      License=Apache \
      Version=0.0.3 \
      Maintainer="Inidus <security@inidus.cloud>"

# Docker - Set ARG to be used in the build
ARG EXPLORER_WAR
ARG APIEXPLORER_WAR
ARG EHRSCAPEMGR_WAR

# Docker - Set ENV to be used in the build
ENV EXPLORER_PATH=/opt/explorer \
    EXPLORER_WAR=$EXPLORER_WAR \
    EHR_EXPLORER4_APPHOME=/opt/explorer/explorer4_home \
    APIEXPLORER_WAR=$APIEXPLORER_WAR \
    EHRSCAPEMGR_WAR=$EHRSCAPEMGR_WAR

# Inidus - Think!EHR Explorer
# COPY ./source/${EXPLORER_SRC} /tmp/${EXPLORER_SRC}
# RUN mkdir -p ${EXPLORER_PATH} && \
#     apk add --update unzip && \
#     unzip /tmp/${EXPLORER_SRC} -d ${EXPLORER_PATH} && \
#     ln -s ${EXPLORER_PATH}/explorer4.war /usr/local/tomcat/webapps/${EXPLORER_WAR} && \
#     apk del unzip && \
#     rm -rf /tmp/* /var/cache/apk/*
# COPY ./conf/explorer/ ${EHR_EXPLORER4_APPHOME}/conf

# Think!EHR Explorer
RUN mkdir -p $EHR_EXPLORER4_APPHOME
COPY ./source/${EXPLORER_WAR} /usr/local/tomcat/webapps/${EXPLORER_WAR}

# Inidus - EHRscape Manager
COPY ./source/${EHRSCAPEMGR_WAR} /usr/local/tomcat/webapps/${EHRSCAPEMGR_WAR}
# COPY ./conf/ehrscape-manager/ehrscape-manager.properties ${EXPLORER_PATH}/ehrscape-manager.properties
# RUN ln -s ${EXPLORER_PATH}/${EHRSCAPEMGR_WAR} /usr/local/tomcat/webapps/${EHRSCAPEMGR_WAR} && \
#     ln -s ${EXPLORER_PATH}/ehrscape-manager.properties /usr/local/tomcat/conf/ehrscape-manager.properties


# Inidus - API Explorer
COPY ./source/${APIEXPLORER_WAR} /usr/local/tomcat/webapps/${APIEXPLORER_WAR}
# RUN ln -s ${EXPLORER_PATH}/${APIEXPLORER_WAR} /usr/local/tomcat/webapps/${APIEXPLORER_WAR}

EXPOSE 8080

CMD ["catalina.sh", "run"]
