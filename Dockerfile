ARG SYSNAME
ARG CFGNAME

FROM ubuntu:24.04

ENV SYSNAME lauv-simulator
ENV CFGNAME lauv-simulator-1

ADD dune-2024.09.02-x86-64bit-linux-glibc-gcc133-OMST.tar.bz2 ./tmp

RUN mv ./tmp/* ./dune

CMD ./dune/bin/dune -c ${CFGNAME} -p Simulation -V ${SYSNAME}

