#!/bin/sh

read -p "Initialize Repo now? This shall clone ics2021 by default. [y/N] " choice

if [ "$choice" == "" ]; then choice="N"; fi

if [ "$choice" == "Y" ] || [ "$choice" == "y" ]; then
    name=$(git config --get user.name)
    email=$(git config --get user.email)

    if [ "$name" == "" ] || [ "$email" == "" ]; then
        read -p "input your git username: " name
        read -p "input your git email: " email

        git config --global user.name $name
        git config --global user.email $email
    fi

    cd ~ && git clone -b 2021 https://github.com/NJU-ProjectN/ics-pa.git ics2021 && cd ics2021

    git branch -m master

    bash init.sh nemu

    bash init.sh abstract-machine

    curl https://gist.githubusercontent.com/tekky02/184256c872e82218914b6ef6d2fb0501/raw/e9a8cd2ce6c0ddf4a31f7450cfbd7c575d80515c/ics_Makefile  \
 > Makefile
fi
