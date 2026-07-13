# Rocky DevOps Environment 🚀

![Rocky Linux](https://img.shields.io/badge/Rocky%20Linux-9-green)
![Vagrant](https://img.shields.io/badge/Vagrant-2.x-blue)
![VirtualBox](https://img.shields.io/badge/VirtualBox-7.x-orange)
![Docker](https://img.shields.io/badge/Docker-Engine-blue)
![DevOps](https://img.shields.io/badge/Focus-DevOps-purple)

---

# 📌 Description

**Rocky DevOps Environment** est un laboratoire DevOps local automatisé basé sur :

* **Vagrant**
* **VirtualBox**
* **Rocky Linux 9**
* **Docker**
* **Docker Compose**

L'objectif de ce projet est de créer une machine virtuelle proche d'un serveur d'entreprise afin de pratiquer :

* l'administration Linux ;
* l'automatisation d'infrastructure ;
* la conteneurisation ;
* le déploiement d'applications ;
* les pratiques DevOps modernes.

Ce projet suit une approche **Infrastructure as Code (IaC)** permettant de reconstruire un environnement complet avec une simple commande :

```bash
vagrant up
```

---

# 🏗️ Architecture

```
Machine physique
(Ubuntu Desktop)
        |
        |
        v
+-----------------------------+
|          VirtualBox         |
+-----------------------------+
        |
        |
        v
+--------------------------------+
|        Rocky Linux 9 VM        |
|                                |
|  - Docker Engine               |
|  - Docker Compose              |
|  - Git                         |
|  - Outils système              |
|  - Scripts automatisation      |
|                                |
+--------------------------------+
        |
        |
        v
+----------------+
| Applications   |
| Docker Compose |
+----------------+
```

---

# 🎯 Objectifs du projet

Ce laboratoire permet de pratiquer :

## 🐧 Administration Linux

* gestion des utilisateurs ;
* permissions fichiers ;
* services systemd ;
* gestion des paquets avec DNF ;
* configuration réseau ;
* sécurité serveur.

---

## 🖥️ Virtualisation

* création de machines virtuelles ;
* gestion du cycle de vie avec Vagrant ;
* configuration réseau privée ;
* gestion des ressources VM.

---

## 🐳 Conteneurisation

* installation Docker automatisée ;
* création d'images ;
* utilisation Docker Compose ;
* déploiement de services.

---

## ⚙️ DevOps

* Infrastructure as Code ;
* automatisation serveur ;
* environnements reproductibles ;
* préparation d'environnements proches production.

---

# 🛠️ Technologies utilisées

| Technologie    | Rôle                          |
| -------------- | ----------------------------- |
| Rocky Linux 9  | Système serveur               |
| Vagrant        | Création et automatisation VM |
| VirtualBox     | Hyperviseur local             |
| Docker         | Conteneurisation              |
| Docker Compose | Orchestration locale          |
| Bash Scripts   | Automatisation                |
| Git            | Versionnement                 |

---

# 📋 Prérequis

Installer :

## VirtualBox

Vérification :

```bash
virtualbox --version
```

---

## Vagrant

Vérification :

```bash
vagrant --version
```

---

## Git

Vérification :

```bash
git --version
```

---

# 🚀 Installation

## 1. Cloner le repository

```bash
git clone https://github.com/<username>/rocky-devops.git
```

Entrer dans le dossier :

```bash
cd rocky-devops
```

---

## 2. Création de la VM

Lancer :

```bash
vagrant up
```

Lors du premier démarrage :

* Vagrant télécharge Rocky Linux ;
* configure le réseau ;
* monte les dossiers nécessaires ;
* lance automatiquement le provisioning.

---

## 3. Connexion SSH

```bash
vagrant ssh
```

Résultat :

```bash
[vagrant@rocky-devops ~]$
```

---

# ⚙️ Provisioning automatique

La configuration du serveur est automatisée grâce aux scripts Bash.

Structure :

```
scripts/

├── setup-server.sh
│
├── install-tools.sh
│
├── install-docker.sh
│
└── create-workspace.sh
```

---

## setup-server.sh

Script principal d'orchestration.

Il exécute les différentes étapes :

```
setup-server.sh

        |
        |
        +---- install-tools.sh
        |
        +---- install-docker.sh
        |
        +---- create-workspace.sh
```

---

## install-tools.sh

Installe les outils système :

* Git ;
* Curl ;
* Wget ;
* Vim ;
* Nano ;
* Tree ;
* Htop ;
* outils réseau.

---

## install-docker.sh

Installe automatiquement :

* Docker Engine ;
* Docker CLI ;
* Containerd ;
* Docker Compose Plugin.

Le service Docker est :

* activé au démarrage ;
* démarré automatiquement ;
* configuré pour l'utilisateur `vagrant`.

---

## create-workspace.sh

Prépare les répertoires serveur :

```
/opt

├── projects
│
└── docker
```

Ces dossiers pourront accueillir les applications.

---

# 🔄 Relancer la configuration

Après modification des scripts :

```bash
vagrant provision
```

Cette commande rejoue uniquement la configuration sans recréer la VM.

---

# ⚙️ Configuration VM

Configuration actuelle :

| Ressource    | Valeur        |
| ------------ | ------------- |
| OS           | Rocky Linux 9 |
| CPU          | 2 cores       |
| RAM          | 4 GB          |
| Réseau privé | 192.168.56.10 |
| Hyperviseur  | VirtualBox    |

---

# 🔗 Gestion des projets

Les projets peuvent être connectés à la VM grâce aux dossiers synchronisés Vagrant.

Exemple :

```
ProjetsDevOps/

├── rocky-devops
│
└── student-list
    |
    ├── backend
    ├── frontend
    └── docker-compose.yml
```

Configuration :

```ruby
config.vm.synced_folder "../student-list",
"/home/vagrant/projects/student-list",
type: "rsync"
```

Dans Rocky Linux :

```
/home/vagrant/projects/student-list
```

Le projet peut ensuite être lancé :

```bash
docker compose up -d
```

---

# 📂 Structure du projet

```
rocky-devops/

├── Vagrantfile
│
├── README.md
│
├── scripts/
│   |
│   ├── setup-server.sh
│   ├── install-tools.sh
│   ├── install-docker.sh
│   └── create-workspace.sh
│
└── docs/
```

---

# 🐳 Vérification Docker

Dans Rocky Linux :

```bash
docker --version
```

```bash
docker compose version
```

Tester :

```bash
docker run hello-world
```

---

# 🔄 Commandes Vagrant utiles

Démarrer :

```bash
vagrant up
```

Arrêter :

```bash
vagrant halt
```

Redémarrer :

```bash
vagrant reload
```

Provisionner :

```bash
vagrant provision
```

Synchroniser les fichiers :

```bash
vagrant rsync
```

Connexion SSH :

```bash
vagrant ssh
```

Etat :

```bash
vagrant status
```

Supprimer :

```bash
vagrant destroy
```

---

# 🔐 Pourquoi Rocky Linux ?

Rocky Linux est un excellent choix pour un laboratoire DevOps car il est compatible avec l'écosystème **Red Hat Enterprise Linux (RHEL)**.

Il permet d'apprendre des technologies utilisées dans les infrastructures professionnelles :

* SELinux ;
* firewalld ;
* systemd ;
* DNF ;
* administration serveur entreprise.

Rocky Linux est également une alternative moderne à CentOS Linux et permet de développer des compétences transférables vers :

* RHEL ;
* serveurs cloud ;
* infrastructures d'entreprise ;
* environnements Kubernetes.

---

# 📈 Évolutions prévues

* [x] VM Rocky Linux automatisée avec Vagrant
* [x] Provisioning Bash
* [x] Installation Docker automatique
* [x] Gestion des projets externes
* [ ] Déploiement avec Ansible
* [ ] Configuration Nginx reverse proxy
* [ ] Gestion SSL/TLS
* [ ] Monitoring Prometheus/Grafana
* [ ] CI/CD GitHub Actions
* [ ] Kubernetes local

---

# 👨‍💻 Auteur

**Jonas SO**

Ingénieur Logiciel Full Stack | Aspirant DevOps

Domaines :

* Web & Mobile Development
* Linux Administration
* Docker
* Cloud & Infrastructure
* DevOps

---

# 📜 Licence

Projet personnel d'apprentissage et laboratoire DevOps.
