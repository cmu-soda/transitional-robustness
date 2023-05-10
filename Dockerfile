FROM ubuntu:latest

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get install -y build-essential
RUN apt-get install -y time
RUN apt-get install -y default-jre

RUN mkdir -p home/transitional-robustness/
COPY . home/transitional-robustness/
WORKDIR home/transitional-robustness/
#COPY bin bin
#COPY benchmarks benchmarks
