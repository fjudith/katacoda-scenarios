# DoE: Continuous Delivery

## Spinnaker

[Spinnaker](https://spinnaker.io) est un outil crée par Netflix OSS spécialisé dans le pilotage de la pratique DevOps du **Déploiement Continue (Continuous Deployment, CD)**.
Il est donc également compétent pour le **Continuous Delivery**.

L'object de cet atelier consiste à créer une chaine qui déploiera [Draw.io](https://draw.io) dans un cluster Kubernetes et l'exposera sur Internet avec les URL suivante

* **Non-production**: `https://`_prenom-nom_`-staging.testruction.cio`
* **Production**: `https://`_prenom-nom_`-draw.testruction.io`
