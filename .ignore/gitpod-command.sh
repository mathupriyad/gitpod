#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
cd $DIR
echo "Starting guru-shifu..."
docker-compose -f docker-compose-gitpod.yml up -d
if [ $? == 0 ]
then
  echo "Waiting for guru-shifu to start up.... "
  until $(curl --output /dev/null --silent --head --fail http://localhost:3000/); do
    printf "."
    sleep 1
  done
  echo "Guru-shifu started successfully..."
fi
cd /workspace
