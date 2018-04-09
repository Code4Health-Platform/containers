# Dockerfile for Marand EHR Viewer

FROM tomcat:8-alpine

LABEL Vendor="Inidus" \
      License=Apache \
      Version=0.0.3 \
      Maintainer="Inidus <cloud-ops@inidus.io>"

# Docker - Set ARG to be used in the build
ARG EHRVIEWER_SRC

# Docker - Set ENV to be used in the build
ENV EHRVIEWER_SRC=$EHRVIEWER_SRC \
    EHRVIEWER_PATH=/opt/ehrviewer \
    EHRVIEWER_WAR=ehrviewer.war

# Inidus - WORKDIR
RUN mkdir -p ${EHRVIEWER_PATH}

# Inidus - Install Think!EHR Viewer
COPY ./conf/ehrviewer.properties ${EHRVIEWER_PATH}/ehrviewer.properties

COPY ./source/${EHRVIEWER_SRC} ${EHRVIEWER_PATH}/${EHRVIEWER_WAR}

RUN ln -s ${EHRVIEWER_PATH}/${EHRVIEWER_WAR} /usr/local/tomcat/webapps/${EHRVIEWER_WAR} && \
    ln -s ${EHRVIEWER_PATH}/ehrviewer.properties /usr/local/tomcat/conf/ehrviewer.properties

EXPOSE 8080

CMD ["catalina.sh", "run"]
