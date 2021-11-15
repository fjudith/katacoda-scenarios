## Déclencheur Git

Dans le schéma du pipeline, sélectionner **Configuration**.

Dans la section **Automated Triggers**, cliquer sur bouton **Add trigger**.

Compléter le formulaire tel qu'indiqué ci-dessous:

* **Type**: Git
* **Repo Type**: github
* **Organization or User**: `fjudith`{{copy}}
* **Project**: `docker-draw.io`
* **Branch**: `onepoint`{{copy}}
* **Secret**: `spinnaker`{{copy}}

Cliquer sur le bouton **Save Artifact**.

## Ajout des artefacts

Les contraintes sur la base d'artefacts permettent sécuriser le pipeline Spinnaker, en ne le laissant que où ils ont été modifiés.

## Artefact 1

Dans le champ **Artifacts Constraints**, sélectionner **"Define new artifact..."**.

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