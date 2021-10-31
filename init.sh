#!/bin/bash

git config --global user.name "tekky"
git config --global user.email "tekky@foxmail.com"

cd ~ && git clone -b 2021 https://github.com/NJU-ProjectN/ics-pa.git ics2021 && cd ics2021

git branch -m master

bash init.sh nemu

bash init.sh abstract-machine

echo 'alias hostnamectl=hostname' >> ~/.bashrc # docker can't use hostnamectl

curl https://gist.githubusercontent.com/tekky02/184256c872e82218914b6ef6d2fb0501/raw/e9a8cd2ce6c0ddf4a31f7450cfbd7c575d80515c/ics_Makefile  \
 > Makefile
