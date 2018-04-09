# Marand Think!EHR Explorer

Provides a docker container for Marand Think!EHR Explorer, a component of the Think!EHR Platform, with additional Inidus components

## Overview of the Think!EHR Platform

Marand's [ThinkEHR Platform](http://www.marand.com/thinkehr/) is an [openEHR](https://www.openehr.org/) standard compliant solution for health-care informatics.
All health-care information is stored into vendor-independent openEHR archetypes and templates, which allow multi-language, multi-terminology and multi-unit
support as well as patient state model.

## Getting Started
These instructions will get you a Think!EHR Explorer service up and running on your local machine for development and testing purposes.

### Source files for components
 Add war files to `./source`

### Modify application.properties
Docker COPYs config files into the container when building the image.

ThinkEHR Explorer
- `conf/explorer/explorer.properties`

ThinkEHR EHRscape Manager
- `conf/ehrscape-manager/ehrscape-manager.properties`

### Build image
- `docker build --build-arg EXPLORER_WAR=explorer.war --build-arg EHRSCAPEMGR_WAR=ehrscape-manager.war --build-arg APIEXPLORER_WAR=api-explorer.war . -t explorer-extras`

### Run the container

Start an Explorer container
- `docker run --name explorer-app -d explorer-extras`

Follow the logs
- `docker logs -f explorer-app`

### Testing with Docker Compose
- `docker-compose -f stack.yml up`

### Deploy as Docker stack
- `docker stack deploy -c stack.yml test`
