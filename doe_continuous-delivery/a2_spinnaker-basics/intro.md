# Introduction

L'objectif de cet atelier est de créer une chaine qui déploie [Draw.io](https://draw.io) dans un cluster Kubernetes et l'exposera sur Internet avec les URL suivantes à l'aide du protocole HTTPS:

* **Non-production**: `https://`_prenom-nom_`-staging.testruction.cio`

## Spinnaker

[Spinnaker](https://spinnaker.io) est un outil crée par Netflix OSS spécialisé dans le pilotage de la pratique DevOps du **Déploiement Continue (Continuous Deployment, CD)**.
Il est donc également compétent pour le **Continuous Delivery**.
