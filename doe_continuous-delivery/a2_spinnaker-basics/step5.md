## Stage 2 - Deployment

Le [Déploiement](https://kubernetes.io/fr/docs/concepts/workloads/controllers/deployment/) est une ressource qui définit où et comment l'application doit être lancée.

### Mise en oeuvre

Cliquer sur le bouton **Add stage**

Compléter le formulaire tels qu'indiqué ci-dessous:

* **Type**: **Deploy (Manifest)**
* **Stage name**: `Deployment`{{copy}}
* **Depends On**: Namespace
* **Account**: default
* **Override Namespace**: _Activé_
* **Namepsace**: _USERNAME_`-drawio-staging`
* **Manifest Source**: **Artifact**
* **Manfest Artifact**: Deployment

Cliquer sur le bouton **Save Changes**.
