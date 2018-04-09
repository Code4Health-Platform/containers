# Dockerfile for Marand Think!EHR Demographics

FROM openjdk:8-jre-alpine

LABEL Vendor="Inidus" \
      License=Apache \
      Version=0.0.3 \
      Maintainer="Inidus <cloud-ops@inidus.io>"

# Docker - Set ARG to be used in the build
ARG DEMOGRAPHICS_SRC

# Docker - Set ENV to be used in the build
ENV DEMOGRAPHICS_SRC=$DEMOGRAPHICS_SRC \
    DEMOGRAPHICS_PATH=/opt/demographics \
    DEMOGRAPHICS_JAR=thinkehr-demographics-standalone.jar \
    PSQL_URL=https://jdbc.postgresql.org/download \
    PSQL_JDBC=postgresql-42.2.0.jar \
    TEHR_SLEEP=10

# Inidus - Fetch PostgreSQL JDBC
RUN mkdir -p ${DEMOGRAPHICS_PATH} && \
    apk add --update curl && \
    curl -SL ${PSQL_URL}/${PSQL_JDBC} -o ${DEMOGRAPHICS_PATH}/${PSQL_JDBC} && \
    apk del curl && \
    rm -rf /tmp/* /var/cache/apk/*

# Inidus - WORKDIR
WORKDIR ${DEMOGRAPHICS_PATH}

# Inidus - Include Think!EHR Demographics config
COPY ./source/${DEMOGRAPHICS_SRC} ${DEMOGRAPHICS_JAR}
COPY ./conf/application.properties application.properties

EXPOSE 8384

# Inidus - run .jar
CMD echo "The application will start in ${TEHR_SLEEP}s..." && \
    sleep ${TEHR_SLEEP} && \
    LOG_FILE='logs/demographics_app.log' java -Xmx2048m -jar ./${DEMOGRAPHICS_JAR}
