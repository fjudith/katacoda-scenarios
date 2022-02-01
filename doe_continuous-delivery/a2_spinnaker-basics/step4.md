## Déclencheur Docker Registry

Dans le schéma du pipeline, sélectionner **Configuration**.

Dans la section **Automated Triggers**, cliquer sur bouton **Add trigger**.

Compléter le formulaire tel qu'indiqué ci-dessous:

> **Attention**: Remplacer _USERNAME_ par votre **`prénom-nom`**.

* **Type**: Docker Registry
* **Registry Name**: harbor
* **Organization**: _USERNAME_
* **Image**: _USERNAME_/draw.io

Cliquer sur le bouton **Save Artifact**.

## Ajout des artefacts

Ajouter la contrainte suivante permetttant de filter selon l'image de conteneur souhaitée.

## Artefact 1

Dans le champ **Artifacts Constraints**, sélectionner **"Define new artifact..."**.

Compléter le formulaire tel qu'indiqué ci-dessous:

* **Display Name**: `Container`{{copy}}
* **Account**: `docker-registry`
* **Docker image**: `harbor.testruction.io/idir-tir/draw.io`{{copy}}
* **Use prior execution**: _Activé_

Cliquer sur le bouton **Save Artifact**.
