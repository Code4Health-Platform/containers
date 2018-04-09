# Dockerfile for Marand Think!EHR Explorer

FROM tomcat:8-alpine

LABEL Vendor="Inidus" \
      License=Apache \
      Version=0.0.3 \
      Maintainer="Inidus <cloud-ops@inidus.io>"

# Docker - Set ARG to be used in the build
ARG APIEXPLORER_WAR_SRC

# Docker - Set ENV to be used in the build
ENV APIEXPLORER_WAR_SRC=$APIEXPLORER_WAR_SRC \
    APIEXPLORER_PATH=/opt/apiexplorer \
    APIEXPLORER_WAR=api-explorer.war

# Install Think!EHR Explorer
RUN mkdir -p ${APIEXPLORER_PATH}

# Include Think!EHR Explorer config
COPY ./source/${APIEXPLORER_WAR_SRC} ${APIEXPLORER_PATH}/${APIEXPLORER_WAR}
RUN ln -s ${APIEXPLORER_PATH}/${APIEXPLORER_WAR} /usr/local/tomcat/webapps/${APIEXPLORER_WAR}

EXPOSE 8080

CMD ["catalina.sh", "run"]
