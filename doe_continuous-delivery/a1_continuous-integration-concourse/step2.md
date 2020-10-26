## Lancemment de l'environnement de travail

Lancer la commander suivante pour valider l'ouverture de session dans le conteneur.

```bash
docker container exec -it onepoint bash
```{{execute}}

## Chargement de la CI

Authentification au group `doe` (Devops Enthusiastic).

```bash
fly -t concourse login -c https://ci.testruction.io -n doe
```{{execute}}

Choisir la méthode OIDC/Oauth
* **username**: _p.nom_
* **password**: _mot de passe_

## Téléchargement de la base de code de déploiement

Exécuter la commande suivante pour télécharger le projet:

```bash
git clone https://github.com/fjudith/docker-draw.io
cd docker-draw.io/
```{{execute}}

Charger la banche `onepoint`:

```bash
git checkout "onepoint"
```{{execute}}