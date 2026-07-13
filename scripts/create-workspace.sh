#!/bin/bash

set -e

echo "Création espace de travail..."


sudo mkdir -p /opt/projects


sudo mkdir -p /opt/docker


sudo chown -R vagrant:vagrant /opt/projects
sudo chown -R vagrant:vagrant /opt/docker


echo "Structure créée :"

tree /opt