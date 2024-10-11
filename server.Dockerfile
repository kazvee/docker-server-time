FROM ubuntu

LABEL maintainer="https://github.com/kazvee"

USER root

COPY ./server.bash /

RUN chmod 755 /server.bash
RUN apt -y update
RUN apt -y install bash

USER nobody

ENTRYPOINT [ "/server.bash" ]