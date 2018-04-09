# Marand Think!EHR Viewer

Provides a docker container for Marand Think!EHR Viewer, a component of the Think!EHR Platform.

## Overview of the Think!EHR Platform

Marand's [ThinkEHR Platform](http://www.marand.com/thinkehr/) is an [openEHR](https://www.openehr.org/) standard compliant solution for health-care informatics.
All health-care information is stored into vendor-independent openEHR archetypes and templates, which allow multi-language, multi-terminology and multi-unit
support as well as patient state model.

## Getting Started
These instructions will get you a Think!EHR Viewer service up and running on your local machine for development and testing purposes.

### Source files for components
 - Add the war file to `ehrviewer/source`

### Modify application.properties
Docker COPYs `conf/ehrviewer.properties` when building the image. See `conf/README.md` for example config.

### Build the image
- `docker build --build-arg EHRVIEWER_SRC=ehrviewer.war . -t ehrviewer-app`

### Run the container

Start a Demographics container
- `docker run --name ehrviewer-app -d ehrviewer-app`

Follow the logs
- `docker logs -f ehrviewer-app`

### Testing with Docker Compose
- `docker-compose -f stack.yml up`

### Deploy as Docker stack
- `docker stack deploy -c stack.yml test`
