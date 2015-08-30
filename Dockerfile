FROM dockerizedrupal/base:latest

MAINTAINER Jürgen Viljaste <j.viljaste@gmail.com>

ENV TERM xterm

ADD ./src /src

RUN /src/entrypoint.sh build

VOLUME ["/apache-2.4"]

EXPOSE 80
EXPOSE 443

ENTRYPOINT ["/src/entrypoint.sh", "run"]
