# Introduction

Dans la continuité du [précédent atelier](https://www.katacoda.com/fjudith/courses/doe_continuous-delivery/a2_spinnaker-basics). L'objectif de cet atelier est de créer une chaine qui déploie [Draw.io](https://draw.io) dans un cluster Kubernetes dédié à la production et l'exposera sur Internet avec l'URL suivante à l'aide du protocole HTTPS:

* **Production**: `https://`_prenom-nom_`-draw.testruction.io`

## Spinnaker

[Spinnaker](https://spinnaker.io) est un outil crée par Netflix OSS spécialisé dans le pilotage de la pratique DevOps du **Déploiement Continue (Continuous Deployment, CD)**.
Il est donc également compétent pour la **Livraison Continue (Continuous Delivery)**.
