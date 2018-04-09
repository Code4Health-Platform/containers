#!/bin/bash
# Build container images for each Marand ThinkEHR version, expects thinkehr-server tar.gz files to be in source

if [ $# -ne 2 ]
  then
    echo "INFO: Builds Docker container imnages for each Marand ThinkEHR version found in ./source"
    echo "INFO: ./thinkehr-builder.sh [build|push] [openjdk8|centos7]"
    exit 1;
fi

THINKEHR_OS=$2

version() {
  echo "INFO: find versions"
  COMMAND_LINE='for i in `ls -1 source/thinkehr-server-jsw-2.3.*`; do basename $i .tar.gz |sed 's/thinkehr-server-jsw-//g' >> versions.txt;done'
  eval ${COMMAND_LINE}
}

build_base() {
  echo "INFO: build base"
  COMMAND_LINE='docker build . -f Dockerfile.${THINKEHR_OS}.base -t thinkehr-${THINKEHR_OS}-base'
  eval ${COMMAND_LINE}
}

build_img() {
  echo "INFO: docker build"
  #COMMAND_LINE='for i in `cat versions.txt`; do echo source/\* > .dockerignore && echo \!source/thinkehr-server-jsw-$i.tar.gz >> .dockerignore && echo \!source/thinkehr-server-$i.tar.gz >> .dockerignore && docker build -f Dockerfile.min --build-arg THINKEHR_VER=$i --build-arg THINKEHR_JSW=thinkehr-server-jsw-$i.tar.gz --build-arg THINKEHR_SVR=thinkehr-server-$i.tar.gz . -t inidus/thinkehr-server-openjdk8:$i; done'
  COMMAND_LINE='for i in `cat versions.txt`; do echo source/\* > .dockerignore; echo \!source/thinkehr-server-jsw-$i.tar.gz >> .dockerignore; echo \!source/thinkehr-server-$i.tar.gz >> .dockerignore; docker build -f Dockerfile.${THINKEHR_OS} --build-arg THINKEHR_VER=$i --build-arg THINKEHR_JSW=thinkehr-server-jsw-$i.tar.gz --build-arg THINKEHR_SVR=thinkehr-server-$i.tar.gz . -t thinkehr-${THINKEHR_OS}:$i; done'
  eval ${COMMAND_LINE}
  rm versions.txt
  echo source/README.md > .dockerignore
}

push_img() {
  echo "INFO: docker push"
  COMMAND_LINE='docker push thinkehr-${THINKEHR_OS}:$i; done'
  eval ${COMMAND_LINE}
  rm versions.txt
  echo source/README.md > .dockerignore
}

case $1 in
  build)
  version
  build_base
  build_img
  ;;
  push)
  version
  push_img
  ;;
esac

exit 0
