# Marand Think!EHR CDR

Provides a docker container for Marand Think!EHR CDR, a component of the Think!EHR Platform.

## Overview of the Think!EHR Platform

Marand's [ThinkEHR Platform](http://www.marand.com/thinkehr/) is an [openEHR](https://www.openehr.org/) standard compliant solution for health-care informatics.
All health-care information is stored into vendor-independent openEHR archetypes and templates, which allow multi-language, multi-terminology and multi-unit
support as well as patient state model.

## Getting Started
These instructions will get you a Think!EHR CDR service up and running on your local machine for development and testing purposes.

### Modify application.properties
Docker COPYs `include/conf` to the container when building the image. Edit `include/conf/system.properties` before building the image.

### Build the container image(s)

#### Automagical - thinkehr-builder.sh
Use the thinkehr-builder.sh script that build containers for each of the ThinkEHR versions found in `./source/`
- `./thinkehr-builder.sh [build|push] [openjdk8|centos7]`

#### Manual - openJDK
Build the intermediate container
- `docker build . -f Dockerfile.openjdk8.base -t thinkehr-openjdk8-base`

Build the Think!EHR container
- `docker build -f Dockerfile.openjdk8 --build-arg THINKEHR_VER=2.3.12 --build-arg THINKEHR_JSW=thinkehr-server-jsw-2.3.12.tar.gz --build-arg THINKEHR_SVR=thinkehr-server-2.3.12.tar.gz . -t thinkehr-openjdk8:${THINKEHR_VER}`


#### Manual - Centos 7
Build the intermediate container
- `docker build . -f Dockerfile.centos7.base -t thinkehr-centos7-base`

Build the Think!EHR container
- `docker build -f Dockerfile.centos7 --build-arg THINKEHR_VER=2.3.12 --build-arg THINKEHR_JSW=thinkehr-server-jsw-2.3.12.tar.gz --build-arg THINKEHR_SVR=thinkehr-server-2.3.12.tar.gz . -t thinkehr-centos7:${THINKEHR_VER}`


### Run the container
Start a PostgreSQL container
- `docker run --name thinkehr-db -e POSTGRES_USER=thinkehr -e POSTGRES_PASSWORD=thinkehr -e POSTGRES_DB=thinkehr -d postgres`

Start a ThinkEHR CDR container
- `docker run --name thinkehr-app -v `pwd`/ThinkEhrServer.license:/opt/thinkehr/conf/ThinkEhrServer.license -e JDBC_URL=jdbc:postgresql://thinkehr-db/thinkehr -e JDBC_USERNAME=thinkehr -e JDBC_PASSWORD=thinkehr --link thinkehr-db:postgres -d thinkehr-openjdk8:2.3.12`

Follow the logs
- `docker logs -f thinkehr-app`

### Testing with Docker Compose
- `docker-compose -f stack.yml up`

### Deploy as Docker stack
- `docker stack deploy -c stack.yml test`

### Backup the database
- `docker run -it --rm --link thinkehr-db:postgres postgres psql -h thinkehr-db -U thinkehr`
