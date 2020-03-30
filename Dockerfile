FROM opensuse/tumbleweed:latest

RUN zypper --non-interactive install git make sudo curl vim wget unzip fontconfig python3-pip

ADD . /panfiles

WORKDIR /panfiles

CMD make tiled
