#!/bin/bash

container=gateway

docker ps | grep $container -w -q

if [ $? -eq 0 ]
then
  (docker exec $container bash -c "/root/ssl/app && chown -R hostuser:hostuser /ssl && echo '/ssl ownership fixed' && nginx -s reload" && \
  echo "Certificates updated successfully!") || \
  echo "Certificates update failed!"
else
  echo "Container '$container' was not found!"
fi
