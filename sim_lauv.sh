#!/bin/bash
docker build . -t lauv-simulator

docker run -e "SYSNAME=lauv-simulator-1" lauv-simulator
docker run -e "SYSNAME=manta-omst-3" -e "CFGNAME=manta-omst-3" -it lauv-simulator

for sim in `docker ps -q  --filter ancestor=lauv-simulator`
do
        docker kill $sim
done
