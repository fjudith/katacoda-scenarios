## Chargement du Pipeline.

> **Note**
> Les images sur envoyée dans le registre de conteneurs <https://harbor.testruction.io>.

Intialiser la variable d'environnement selon le format iniqué ci-dessous (i.e. prénom/nom au comple)

```bash
USERNAME="prenom-nom"
```{{copy}}

Exécuter la commande suivante pour charger la configuration du pipeline dans le serveur Concourse

> Note: Remplacer le mot de passe **[[PASSWORD]]**, par celui fournie par l'instructeur

```bash
fly -t concourse set-pipeline --config './concourse.yaml' --pipeline "${USERNAME}-draw.io" -v 'registry-email=admin@example.com' -v 'registry-username=doe' -v 'registry-password=[[PASSWORD]]' -v 'registry-repo=doe' -v 'registry-repo=harbor.testruction.io/${USERNAME}'
```{{copy}}

### Lancement du pipeline

Le pipleline d'intégration peut être soumis de 2 manière.

1. Manuellement depuis l'interface Web <https://ci.testruction.io>, puis en cliquant sur le bouton **Play**.
2. Depuis la ligne de commande:

```bash
fly -t concourse unpause-pipeline -p "${USERNAME}-draw.io
```{{execute}}

> Le processus d'intégration dure environ **15 minutes**.
