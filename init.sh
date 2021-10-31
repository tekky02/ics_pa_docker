#!/bin/bash

git config --global user.name "tekky"
git config --global user.email "tekky@foxmail.com"

cd ~ && git clone -b 2021 https://github.com/NJU-ProjectN/ics-pa.git ics2021 && cd ics2021

git branch -m master

bash init.sh nemu

bash init.sh abstract-machine

sed -i 's/hostnamectl/hostname/g' nemu/scripts/git.mk # docker can't use hostnamectl command
