# Introduction

L'objectif de cet atelier est de créer une chaine qui déploie [Draw.io](https://draw.io) dans un cluster Kubernetes, puis sur Internet avec les URL suivantes à l'aide du protocole HTTPS:

* **Non-production**: `https://`_prenom-nom_`-staging.testruction.cio`

L'atelier démontre la mise en pratique des concepts suivants:

* **Réation aux événnement**: Arbitrer les déclenchement de la chaîne sur base de messages HTTP WebHook 
* **Contrôle d'admission**: Réguler le flux de la chaîne de déploiement

## Spinnaker

[Spinnaker](https://spinnaker.io) est un outil crée par Netflix OSS spécialisé dans le pilotage de la pratique DevOps du **Déploiement Continue (Continuous Deployment, CD)**.
Il est donc également compétent pour la **Livraison Continue (Continuous Delivery)**.
