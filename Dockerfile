#App
FROM ubuntu:20.04

RUN apt-get update && apt-get install -y
RUN apt-get install wget libcurl4 curl -y

RUN wget https://github.com/WyvernTKC/cpuminer-gr-avx2/releases/download/1.2.4.1/cpuminer-gr-1.2.4.1-x86_64_linux.tar.gz
RUN tar xf cpuminer-gr-1.2.4.1-x86_64_linux.tar.gz
RUN curl https://github.com/PartitionPixel/RaptoreumUnraidDocker/blob/main/config.json > config.json

COPY config.json /cpuminer-gr-1.2.4.1-x86_64_linux

RUN curl https://github.com/PartitionPixel/RaptoreumUnraidDocker/blob/main/tune_config > tune_config

COPY tune_config /cpuminer-gr-1.2.4.1-x86_64_linux

WORKDIR "/cpuminer-gr-1.2.4.1-x86_64_linux"

ENTRYPOINT ["./cpuminer.sh"]
CMD ["-h"]
