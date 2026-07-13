#!/bin/bash

set -e

echo "Installation Docker..."


if command -v docker &> /dev/null
then
    echo "Docker est déjà installé."
else

    sudo dnf install -y yum-utils


    sudo dnf config-manager \
        --add-repo \
        https://download.docker.com/linux/centos/docker-ce.repo


    sudo dnf install -y \
        docker-ce \
        docker-ce-cli \
        containerd.io \
        docker-buildx-plugin \
        docker-compose-plugin

fi


sudo systemctl enable docker
sudo systemctl start docker


sudo usermod -aG docker vagrant


echo "Docker installé."


docker --version
docker compose version