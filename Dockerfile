FROM ubuntu:focal

RUN apt-get update
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y build-essential docutils-common libelfin-dev nodejs npm python3
RUN mkdir -p coz
COPY . coz/

RUN cd coz/ && make && make install
