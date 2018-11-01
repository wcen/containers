FROM python:3.7.1-alpine3.8
LABEL maintainer="cew1350@gmail.com"

RUN \
  pip3 install \
    requests

ADD start.py /tmp/start.py
ENTRYPOINT [ "python3" ]
CMD [ "/tmp/start.py" ]
