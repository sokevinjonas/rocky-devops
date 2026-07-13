# Rocky DevOps Environment 🚀

![Rocky Linux](https://img.shields.io/badge/Rocky%20Linux-9-green)
![Vagrant](https://img.shields.io/badge/Vagrant-2.x-blue)
![VirtualBox](https://img.shields.io/badge/VirtualBox-7.x-orange)
![DevOps](https://img.shields.io/badge/Focus-DevOps-purple)

## 📌 Description

**Rocky DevOps Environment** est un environnement de développement et de test DevOps automatisé basé sur **Vagrant**, **VirtualBox** et **Rocky Linux 9**.

L'objectif de ce projet est de créer une machine virtuelle locale proche d'un environnement serveur d'entreprise afin de pratiquer :

* l'administration Linux ;
* l'automatisation d'infrastructure ;
* le déploiement d'applications ;
* la conteneurisation avec Docker ;
* les outils DevOps modernes.

Cette approche permet de reproduire un environnement serveur sans utiliser directement un VPS ou une infrastructure cloud.

---

# 🏗️ Architecture

```
Machine physique
(HP EliteBook / Ubuntu Desktop)
        |
        |
        v
+-----------------------------+
|          VirtualBox         |
+-----------------------------+
        |
        |
        v
+-----------------------------+
|       Rocky Linux 9 VM      |
|                             |
|  - Docker Engine            |
|  - Docker Compose           |
|  - Nginx                    |
|  - Services DevOps          |
+-----------------------------+
```

---

# 🎯 Objectifs du projet

Ce laboratoire permet de pratiquer :

## Linux Administration

* gestion des utilisateurs ;
* permissions fichiers ;
* services systemd ;
* gestion des paquets avec DNF ;
* configuration réseau ;
* sécurité Linux.

## Virtualisation

* création de machines virtuelles ;
* gestion du cycle de vie avec Vagrant ;
* configuration réseau privée ;
* gestion des ressources VM.

## Conteneurisation

* installation Docker ;
* création d'images ;
* utilisation de Docker Compose ;
* déploiement de services.

## DevOps

* automatisation d'environnement ;
* Infrastructure as Code ;
* préparation d'environnements reproductibles.

---

# 🛠️ Technologies utilisées

| Technologie    | Rôle                          |
| -------------- | ----------------------------- |
| Rocky Linux 9  | Système serveur               |
| Vagrant        | Automatisation de création VM |
| VirtualBox     | Hyperviseur local             |
| Docker         | Conteneurisation              |
| Docker Compose | Orchestration locale          |
| Git            | Versionnement                 |

---

# 📋 Prérequis

Avant de commencer, installer :

## VirtualBox

Vérifier :

```bash
virtualbox --version
```

## Vagrant

Vérifier :

```bash
vagrant --version
```

## Git

Vérifier :

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

## 2. Créer la machine virtuelle

Lancer :

```bash
vagrant up
```

Lors du premier lancement, Vagrant télécharge automatiquement l'image Rocky Linux.

---

## 3. Se connecter à la VM

```bash
vagrant ssh
```

Vous devez obtenir :

```bash
[vagrant@rocky-devops ~]$
```

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

# 🐳 Installation Docker

Dans la VM :

Mise à jour :

```bash
sudo dnf update -y
```

Installation Docker :

```bash
sudo dnf install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
```

Activation du service :

```bash
sudo systemctl enable docker
sudo systemctl start docker
```

Ajouter l'utilisateur au groupe Docker :

```bash
sudo usermod -aG docker vagrant
```

Reconnecter la session :

```bash
exit
vagrant ssh
```

Tester :

```bash
docker version
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
│
└── documentation/
```

---

# 🔗 Gestion des projets

Les projets applicatifs peuvent être montés dans la VM grâce aux dossiers partagés Vagrant.

Exemple :

Structure locale :

```
ProjetsDevOps/

├── rocky-devops/
│     └── Vagrantfile
│
└── mon-projet/
      ├── backend
      ├── frontend
      └── docker-compose.yml
```

Dans le `Vagrantfile` :

```ruby
config.vm.synced_folder "../mon-projet",
"/home/vagrant/projects/mon-projet"
```

Le projet devient accessible dans Rocky Linux :

```
/home/vagrant/projects/mon-projet
```

---

# 🔄 Commandes Vagrant utiles

Démarrer la VM :

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

Se connecter :

```bash
vagrant ssh
```

Supprimer la VM :

```bash
vagrant destroy
```

Voir l'état :

```bash
vagrant status
```

---

# 🔐 Pourquoi Rocky Linux ?

Rocky Linux est choisi car il est compatible avec l'écosystème Red Hat Enterprise Linux (RHEL).

Il permet de pratiquer des technologies utilisées dans les environnements professionnels :

* SELinux ;
* firewalld ;
* systemd ;
* dnf ;
* administration serveur entreprise.

---

# 📈 Évolutions prévues

Ce laboratoire pourra évoluer vers :

* [ ] Installation automatique Docker avec scripts ;
* [ ] Déploiement avec Ansible ;
* [ ] Configuration Nginx reverse proxy ;
* [ ] Gestion SSL/TLS ;
* [ ] Monitoring avec Prometheus/Grafana ;
* [ ] CI/CD avec GitHub Actions ;
* [ ] Déploiement Kubernetes local.

---

# 👨‍💻 Auteur

**Jonas SO**

Ingénieur Logiciel Full Stack | Aspirant DevOps

Domaines :

* Web & Mobile Development
* Cloud & Infrastructure
* Docker
* Linux Administration

---

# 📜 Licence

Projet personnel d'apprentissage et de laboratoire DevOps.
