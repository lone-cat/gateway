#!/bin/bash

if [ -f ./docker/docker-compose.override.yml ]
then
  docker-compose -p gateway -f ./docker/docker-compose.yml -f ./docker/docker-compose.override.yml down --volumes -t 300
else
  docker-compose -p gateway -f ./docker/docker-compose.yml down --volumes -t 300
fi