#!/bin/bash

if [ -f ./docker/docker-compose.override.yml ]
then
  # pre-build gateway
  docker-compose -p gateway -f ./docker/docker-compose.yml -f ./docker/docker-compose.override.yml build && \
  # start gateway
  docker-compose -p gateway -f ./docker/docker-compose.yml -f ./docker/docker-compose.override.yml up -d
else
  # pre-build gateway
  docker-compose -p gateway -f ./docker/docker-compose.yml build && \
  # start gateway
  docker-compose -p gateway -f ./docker/docker-compose.yml up -d
fi


