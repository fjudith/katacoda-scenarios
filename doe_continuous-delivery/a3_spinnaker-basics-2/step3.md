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

Les contraintes sur la base d'artefacts sécuriser le pipeline Spinnake, en ne le lassant que où ils ont été modifiés.

## Artefact 1

Dans le champ **Artfactifacts Constraints**, sélectionner **"Define new artifact..."**.

Compléter le formulaire tel qu'indiqué ci-dessous:

* **Display Name**: `Deployment`
* **Account**: `github-artifact-account`
* **File path**: `deploy/kubernetes/manifests/deployment.yaml`{{copy}}
* **Use prior execution**: _Activé_

Cliquer sur le bouton **Save Artifact**.

## Artefact 2

Dans le champ **Artfactifacts Constraints**, sélectionner **"Define new artifact..."**.

Compléter le formulaire tel qu'indiqué ci-dessous:

* **Display Name** `Service`
* **Account** `github-artifact-account`
* **File path** `deploy/kubernetes/manifests/service.yaml`{{copy}}
* **Use prior execution** _Activé_

Cliquer sur le bouton **Save Artifact**.

Cliquer sur **Save Changes**.
