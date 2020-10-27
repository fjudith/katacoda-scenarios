## Stage 2 - Deployment

La configuration du stage [Service](https://kubernetes.io/docs/concepts/services-networking/service/) doit être modifiée afin de pointer vers l'environnement de production.

### Mise en oeuvre

Dans le schéma du pipeline, sélectionner **Service**.

Modifier le formulaire tels qu'indiqué ci-dessous:

* **Override Namespace**: _Activé_
* **Namepsace**: _USERNAME_`-drawio`
* **Manfest Artifact**: Service

Cliquer sur le bouton **Save Changes**.
