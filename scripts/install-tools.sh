#!/bin/bash

set -e

echo "Installation des outils système..."


sudo dnf update -y


sudo dnf install -y \
    git \
    curl \
    wget \
    vim \
    nano \
    unzip \
    tree \
    htop \
    net-tools \
    bash-completion


echo "Outils installés avec succès."