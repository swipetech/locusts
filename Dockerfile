FROM ubuntu:18.04

LABEL maintainer eduardo@swipetech.io

RUN apt-get -y update

RUN apt-get -y install \
        libevent-dev \
        python3.7-dev \
        python3.7 \
        python3-pip

RUN python3.7 -m pip install locustio==0.11

COPY ./run.py /run.py

RUN ulimit -n 1000000

EXPOSE 8089
EXPOSE 5557
EXPOSE 5558

ENTRYPOINT ["python3.7", "-u", "/run.py"]
