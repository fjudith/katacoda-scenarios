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

Cliquer sur le bouton **Save Changes**.
