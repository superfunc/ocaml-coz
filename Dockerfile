FROM ubuntu:focal

# Install deps for coz
RUN apt-get update
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y git build-essential \
                                             docutils-common libelfin-dev nodejs npm python3

# Download and build coz
RUN rm -rf coz
RUN git clone --depth 1 https://github.com/plasma-umass/coz
RUN cd coz/ && make && make install

# Install ocaml deps
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y ocaml opam pkg-config libffi-dev
RUN opam init -a -y --disable-sandboxing
RUN eval $(opam env)
RUN opam install -y ctypes ctypes-foreign

# Build ocaml ffi wrapper
