FROM ubuntu:focal

RUN apt-get update
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y git build-essential \
                                             docutils-common libelfin-dev nodejs npm python3
RUN rm -rf coz
RUN git clone --depth 1 https://github.com/plasma-umass/coz
RUN cd coz/ && make && make install

# TODO: RUN dune build coz-bindings
