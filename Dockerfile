FROM ubuntu:16.04

ADD ./scripts/* /scripts/
RUN chmod +x /scripts/*
VOLUME /scripts
CMD /bin/sh
