#!/bin/bash
if [ -z "$1" ]
then
  echo "Usage: $0 <Number Of Simulators>"
  exit 1
fi


docker build . -t lauv-simulator
for ((i = 1; i <= $1; i++))
do
	docker run -e "SYSNAME=lauv-simulator-$i" lauv-simulator &
done

docker run -e "SYSNAME=manta-omst-3" -e "CFGNAME=manta-omst-3" -it lauv-simulator 

for sim in `docker ps -q  --filter ancestor=lauv-simulator`
do
        docker kill $sim
done
