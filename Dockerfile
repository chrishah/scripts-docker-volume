FROM ubuntu:16.04

ADD ./scripts/* /scripts/
VOLUME /scripts
CMD /bin/sh
