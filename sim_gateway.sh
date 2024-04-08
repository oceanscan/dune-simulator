#!/bin/bash
docker build . -t lauv-simulator
docker run -e "SYSNAME=manta-gateway" -e "CFGNAME=manta-omst-3" -it lauv-simulator

