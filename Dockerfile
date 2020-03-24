FROM opensuse/tumbleweed:latest

RUN zypper --non-interactive install git make

ADD . /panfiles

WORKDIR /panfiles

CMD make tiled
