## Création du pipeline d'approbation

Naviguer vers <https://cd.testruction.io>

Utiliser le comptes `p.nom` avec le mot de passe passe `password` (mot de passe Keycloak).

le compte fournie par le formateur pour vous connecter.

Cliquer sur le menu **Application** situé en haut de la fenêtre, puis sélectionner votre application (i.e. _USERNAME_`-drawio`)

Dans le panneau de gauche, sélectionner **PIPELINES** puis cliquer sur le bouton **Create**.

Compléter le formulaire tels qu'indiqué ci-dessous:

* **Type**: Pipeline
* **Pipeline Name**: `Validate staging`{{copy}}

Cliquer sur le bouton **Create**.

## Configuration du déclencheur

Dans la section **Automated Triggers**, cliquer sur le bouton **Add Trigger**.

Compléter le formulaire tels qu'indiqué ci-dessous:

* **Type**: Pipeline
* **Application**: _USERNAME_`-drawio`
* **Pipeline**: Deploy to staging
* **Pipeline Status**: `successful`

Cliquer sur le bouton **Save Changes**.
