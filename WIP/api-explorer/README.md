# Marand Think!EHR Explorer

Provides Think!EHR Explorer and related components

## Source files for components
 - Add Explorer zip file to `explorer/source`
 - Add ehrscape-manager war file to `explorer/source`
 - Add api-explorer war file to `explorer/source`

## Build image
To build container image with Docker, expects files in source
- `docker build --build-arg EXPLORER_ZIP=ehrexplorer-v4.7.40.zip --build-arg EHRSCAPEMGR_WAR=ehrscape-manager.war --build-arg APIEXPLORER_WAR=api-explorer.war . -t inidus/marand-explorer`
