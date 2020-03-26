FROM opensuse/tumbleweed:latest

RUN zypper --non-interactive install git make sudo curl vim

ADD . /panfiles

WORKDIR /panfiles

CMD make tiled
