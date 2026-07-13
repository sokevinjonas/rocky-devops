#!/bin/bash

set -e

echo "======================================"
echo " Rocky Linux DevOps Server Setup"
echo "======================================"


SCRIPT_DIR="/home/vagrant/scripts"


echo ""
echo ">>> Installation des outils système"
bash "$SCRIPT_DIR/install-tools.sh"


echo ""
echo ">>> Installation Docker"
bash "$SCRIPT_DIR/install-docker.sh"


echo ""
echo ">>> Création espace de travail"
bash "$SCRIPT_DIR/create-workspace.sh"


echo ""
echo "======================================"
echo " Configuration terminée avec succès"
echo "======================================"