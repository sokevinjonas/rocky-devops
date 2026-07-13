# 🔗 Intégration de projets dans une VM Rocky Linux avec Vagrant

## 📌 Introduction

Une machine virtuelle DevOps ne sert pas uniquement à installer un système d'exploitation.

Elle permet de créer un environnement proche d'un serveur de production dans lequel nous pouvons :

* héberger plusieurs projets ;
* tester des configurations ;
* déployer des applications ;
* pratiquer l'administration système ;
* reproduire un environnement professionnel.

Dans ce laboratoire, la VM Rocky Linux créée avec Vagrant représente un serveur Linux local.

Architecture générale :

```
Machine physique
(Ubuntu Desktop)
        |
        |
        v
VirtualBox
        |
        |
        v
Rocky Linux VM
        |
        |
        +----------------+
        | Docker Engine |
        +----------------+
              |
              |
        +-------------+
        | Projets     |
        +-------------+
        |
        +-- API Backend
        |
        +-- Frontend
        |
        +-- Database
```

---

# 1. Pourquoi connecter les projets à la VM ?

Dans un environnement professionnel, les applications ne tournent généralement pas directement sur la machine du développeur.

On retrouve plutôt :

```
Développeur
     |
     |
Serveur de développement
     |
     |
Serveur de production
```

La VM Rocky Linux joue donc le rôle d'un serveur de développement local.

Cela permet :

* d'avoir un environnement isolé ;
* d'éviter de polluer le système principal ;
* de reproduire une infrastructure serveur ;
* de tester avant un déploiement réel.

---

# 2. Méthode recommandée : dossier partagé Vagrant

Vagrant permet de partager un dossier entre la machine hôte et la VM.

Exemple :

Sur Ubuntu :

```
ProjetsDevOps/

├── rocky-devops
│       |
│       └── Vagrantfile
│
├── student-list
│       |
│       ├── backend
│       ├── frontend
│       └── docker-compose.yml
│
└── ARENIA
        |
        ├── api
        ├── mobile
        └── docker-compose.yml
```

---

Dans le `Vagrantfile` :

```ruby
config.vm.synced_folder "../student-list",
"/home/vagrant/projects/student-list"

config.vm.synced_folder "../ARENIA",
"/home/vagrant/projects/ARENIA"
```

Après :

```bash
vagrant reload
```

Les projets deviennent accessibles dans Rocky Linux :

```
/home/vagrant/projects/

├── student-list
│
└── ARENIA
```

---

# 3. Exemple avec plusieurs projets Docker

Architecture dans Rocky Linux :

```
Rocky Linux VM

/home/vagrant/projects

├── student-list
│
│    docker-compose.yml
│
├── ARENIA
│
│    docker-compose.yml
│
└── Couturart
     
     docker-compose.yml
```

Chaque projet possède son propre environnement :

```
student-list

Docker Compose

├── Backend
├── PostgreSQL
└── Redis


ARENIA

Docker Compose

├── API NestJS
├── PostgreSQL
└── Redis


Couturart

Docker Compose

├── Laravel
├── MySQL
└── Nginx
```

---

# 4. Exemple de workflow quotidien

## Développement

Sur Ubuntu :

```bash
cd ~/Bureau/ProjetsDevOps/ARENIA
```

Modifier le code normalement.

---

## Accéder à la VM

```bash
cd ~/Bureau/ProjetsDevOps/rocky-devops

vagrant ssh
```

---

## Aller dans le projet

Dans Rocky Linux :

```bash
cd ~/projects/ARENIA
```

---

## Lancer les services

```bash
docker compose up -d
```

Les applications tournent maintenant dans l'environnement Rocky Linux.

---

# 5. Alternative : cloner directement les projets dans la VM

Une autre approche consiste à utiliser Git directement dans Rocky Linux.

Exemple :

```bash
cd /home/vagrant

git clone https://github.com/user/project.git
```

Structure :

```
Rocky Linux

/home/vagrant

├── project-a
├── project-b
└── project-c
```

Avantages :

* environnement complètement indépendant ;
* proche d'un vrai serveur.

Inconvénient :

* le code n'est plus directement visible depuis Ubuntu sans SSH.

---

# 6. Quelle méthode choisir ?

## Projet personnel / développement local

Recommandation :

```
Ubuntu
 |
 +-- Code source
 |
 +-- Vagrant VM
       |
       +-- Docker
```

Utiliser :

```
synced_folder
```

---

## Serveur de test proche production

Recommandation :

```
VM Rocky Linux

Git clone

Docker Compose

Services
```

---

# Pourquoi Rocky Linux est un excellent choix ?

## 1. Une distribution orientée entreprise

Rocky Linux est conçu pour être compatible avec Red Hat Enterprise Linux (RHEL), une des distributions Linux les plus utilisées dans les grandes entreprises.

Beaucoup d'organisations utilisent l'écosystème Red Hat pour :

* serveurs applicatifs ;
* infrastructures cloud ;
* bases de données ;
* systèmes critiques.

Choisir Rocky Linux permet donc d'apprendre des technologies proches du monde professionnel.

---

# 2. Une alternative moderne à CentOS

Pendant longtemps, CentOS était utilisé comme version gratuite proche de RHEL.

Architecture historique :

```
Red Hat Enterprise Linux
          |
          |
       CentOS
```

Après l'arrêt de CentOS Linux classique, Rocky Linux est devenu une alternative majeure :

```
Red Hat Enterprise Linux
          |
          |
    Rocky Linux
```

Il conserve une philosophie similaire :

* stabilité ;
* sécurité ;
* compatibilité entreprise.

---

# 3. Une grande stabilité serveur

Rocky Linux privilégie la stabilité plutôt que la nouveauté.

C'est important pour un serveur.

Un serveur doit fonctionner pendant :

* plusieurs mois ;
* plusieurs années ;

sans modifications risquées.

---

# 4. Apprentissage des outils Red Hat

Avec Rocky Linux, on apprend des outils très utilisés :

## Gestion des paquets

Au lieu de :

```bash
apt install
```

on utilise :

```bash
dnf install
```

---

## Gestion des services

Comme toutes les distributions modernes :

```bash
systemctl start service
systemctl enable service
```

---

## Sécurité

Rocky Linux permet de pratiquer :

* SELinux ;
* firewalld ;
* gestion des permissions ;
* durcissement serveur.

---

# 5. Très utilisé dans le Cloud et DevOps

Rocky Linux est adapté pour apprendre :

* Docker ;
* Kubernetes ;
* Ansible ;
* Terraform ;
* CI/CD ;
* administration serveur.

Il permet de construire des compétences transférables vers :

* RHEL ;
* AWS ;
* Azure ;
* infrastructures privées.

---

# 6. Pourquoi ne pas simplement utiliser Ubuntu ?

Ubuntu reste un excellent choix.

La différence principale :

| Ubuntu                               | Rocky Linux                                            |
| ------------------------------------ | ------------------------------------------------------ |
| Très populaire chez les développeurs | Très populaire en entreprise                           |
| Basé sur Debian                      | Compatible Red Hat                                     |
| Utilise apt                          | Utilise dnf                                            |
| Très présent dans le Cloud           | Très présent dans les infrastructures professionnelles |
| Plus simple pour débuter             | Plus proche des environnements entreprise              |

Les deux sont de très bons choix.

---

# Conclusion

Rocky Linux est un excellent choix pour ce laboratoire car il permet de :

* simuler un serveur professionnel ;
* apprendre l'administration Linux entreprise ;
* pratiquer Docker et DevOps ;
* comprendre l'écosystème Red Hat ;
* préparer des compétences utiles pour le Cloud et l'administration système.

Cette VM devient un véritable laboratoire DevOps local capable d'accueillir plusieurs projets et plusieurs environnements.
