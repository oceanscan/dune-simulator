ARG SYSNAME
ARG CFGNAME

FROM ubuntu:22.04

ENV SYSNAME lauv-simulator
ENV CFGNAME lauv-simulator-1
ADD dune-2024.03.00-x86-64bit-linux-glibc-gcc114-OMST.tar.bz2 ./tmp
RUN mv ./tmp/* ./dune

CMD ./dune/bin/dune -c ${CFGNAME} -p Simulation -V ${SYSNAME}

