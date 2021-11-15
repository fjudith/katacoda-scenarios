## Création du pipeline de mise en production

Dans le panneau de gauche, sélectionner **PIPELINES** puis cliquer sur le bouton **Create**.

Compléter le formulaire tels qu'indiqué ci-dessous:

* **Type**: Pipeline
* **Pipeline Name**: `Promote to Production`{{copy}}
* **Copy From**: Deploy to Staging

Cliquer sur le bouton **Create**.

## Configuration du déclencheur

Dans la section **Automated Triggers**, localiser le trigger `Git` puis cliquer sur le bouton **Remove Trigger**.

Cliquer sur le bouton **Add Trigger**, puis compléter le formulaire tels qu'indiqué ci-dessous:

* **Type**: Pipeline
* **Application**: _USERNAME_`-drawio`
* **Pipeline**: Validate Staging
* **Pipeline Status**: `successful`

## Configuration des artefacts

> **Rappel**:
> Les contraintes sur la base d'artefacts permettent sécuriser le **Contrôle d'admission** du pipeline Spinnaker, afin qu'il ne réagisse qu'en cas de modification précise du code.

## Artefact 1

Dans le champ **Artifacts Constraints**, sélectionner **"Define new artifact..."**.

Compléter le formulaire tel qu'indiqué ci-dessous:

* **Display Name**: `Deployment`
* **Account**: `github-artifact-account`
* **File path**: `deploy/kubernetes/manifests/deployment.yaml`{{copy}}
* **Use prior execution**: _Activé_

Cliquer sur le bouton **Save Artifact**.

## Artefact 2

Dans le champ **Artifacts Constraints**, sélectionner **"Define new artifact..."**.

Compléter le formulaire tel qu'indiqué ci-dessous:

* **Display Name** `Service`
* **Account** `github-artifact-account`
* **File path** `deploy/kubernetes/manifests/service.yaml`{{copy}}
* **Use prior execution** _Activé_

Cliquer sur le bouton **Save Artifact**.

Cliquer sur **Save Changes**.

## Artefact 3

Dans le champ **Artifacts Constraints**, sélectionner **"Define new artifact..."**.

Compléter le formulaire tel qu'indiqué ci-dessous:

* **Display Name**: `Container`{{copy}}
* **Account**: `docker-registry`
* **Docker image**: `harbor.testruction.io/idir-tir/draw.io`{{copy}}
* **Use prior execution**: _Activé_

Cliquer sur le bouton **Save Artifact**.
