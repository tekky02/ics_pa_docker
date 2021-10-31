FROM ubuntu:20.04

RUN apt-get update -y && apt-get install -y apt-transport-https ca-certificates && \
    mv /etc/apt/sources.list /etc/apt/sources.list.back && echo \
    "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal main restricted universe multiverse\n"\
    "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-updates main restricted universe multiverse\n"\
    "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-backports main restricted universe multiverse\n"\
    "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-security main restricted universe multiverse\n" \
  > /etc/apt/sources.list && apt-get update -y && apt-get upgrade -y && \
  apt-get install -y libncurses5-dev make gcc g++ bison flex libreadline-dev \
  vim git curl wget llvm-11 && rm -rf /var/cache/apt/*

COPY init.sh /init.sh

CMD ["sh", "init.sh"]
