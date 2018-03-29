# Marand Think!EHR
Provides Think!EHR CDR

## Make the container image
First create the intermediate container used for the build
- `docker build -f Dockerfile.base . -t marand-thinkehr-base`

Build a container with the specified version of Think!EHR from .tar.gz in source
 - `docker build -f Dockerfile.tagged --build-arg THINKEHR_JSW=thinkehr-server-jsw-2.3.7.tar.gz --build-arg THINKEHR_SVR=thinkehr-server-2.3.7.tar.gz . -t inidus/marand-thinkehr`

## Build all available THINKEHR_VER images
Build container images for each Marand ThinkEHR version found in source
- `./thinkehr-builder.sh build`
Push container images for each Marand ThinkEHR version found in source
- `./thinkehr-builder.sh push`
