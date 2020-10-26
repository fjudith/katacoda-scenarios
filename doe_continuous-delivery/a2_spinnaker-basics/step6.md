## Stage 3 - Service

Par défaut, une application n'est pas joignable dans Kubernetes.
Un [Service](https://kubernetes.io/docs/concepts/services-networking/service/) permet d'exposer le port d'écoute de l'application à l'intérieur du cluster.

Dans le shéma du pipeline, sélectionner **Namespace**.

Cliquer sur le bouton **Add stage**

Compléter le formulaire tels qu'indiqué ci-dessous:

* **Type**: **Deploy (Manifest)**
* **Stage name**: `Service`{{copy}}
* **Depends On**: Namespace
* **Account**: default
* **Manifest Source**: **Artifact**
* **Manfest Artifact**: Service

Cliquer sur **Save Changes**.
