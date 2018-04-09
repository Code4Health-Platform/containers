# Dockerfile for Inidus EHRscape Manager

FROM tomcat:8-alpine

LABEL Vendor="Inidus" \
      License=Apache \
      Version=0.0.3 \
      Maintainer="Inidus <cloud-ops@inidus.io>"

# Docker - Set ARG to be used in the build
ARG EHRSCAPEMGR_WAR_SRC

# Docker - Set ENV to be used in the build
ENV EHRSCAPEMGR_WAR_SRC=$EHRSCAPEMGR_WAR_SRC \
    EHRSCAPEMGR_WAR=ehrscape-manager.war

# Include Think!EHR Explorer config
COPY ./source/ehrscape-manager.war /usr/local/tomcat/webapps/${EHRSCAPEMGR_WAR}
COPY ./conf/ehrscape-manager.properties /usr/local/tomcat/conf/application.properties

EXPOSE 8080

CMD ["catalina.sh", "run"]
