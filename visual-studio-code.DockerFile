# Visual Studio Code
FROM debian:latest

ENV DEBIAN_FRONTEND noninteractive 

RUN apt-get update && apt-get install -y unzip sudo wget libgtk2.0-0 libgconf2-4 libnss3 libnotify4 gnupg \  
    libasound2 libxkbfile1 libsecret-1-0 libxtst6 libcanberra-gtk-module libgl1-mesa-glx libxss1 && rm -rf /var/lib/apt/lists/* && \
    wget https://go.microsoft.com/fwlink/?LinkID=760868 -O vscode.deb && \
    dpkg -i vscode.deb && rm vscode.deb && \
    useradd -m vscode -s /bin/bash

WORKDIR /vsc

USER vscode

# CMD code --verbose --disable-gpu