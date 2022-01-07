#App
FROM ubuntu:20.04

RUN apt-get update && apt-get install -y
RUN apt-get install wget libcurl4 -y

RUN wget https://github.com/WyvernTKC/cpuminer-gr-avx2/releases/download/1.2.4.1/cpuminer-gr-1.2.4.1-x86_64_linux.tar.gz
RUN tar xf cpuminer-gr-1.2.4.1-x86_64_linux.tar.gz
ADD curl https://github.com/PartitionPixel/RaptoreumUnraidDocker/blob/main/config.json > config.conf

WORKDIR "/cpuminer-gr-1.2.4.1-x86_64_linux"

ENTRYPOINT ["./cpuminer.sh"]
CMD ["-h"]
