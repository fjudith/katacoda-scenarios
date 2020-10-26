### Stage 2 - Deployment

Le déploiement est une ressource qui définit où et comment l'application doit être lancée.

### Mise en oeuvre

Cliquer sur le bouton **Add stage**

Compléter le formulaire tels qu'indiqué ci-dessous:

Nom | Valeur
--- | -----
**Type** | **Deploy (Manifest)**
**Stage name** | `Deployment`{{copy}}
**Depends On** | `Namespace`
**Account** | `default`
**Manifest Source** | **Artifact**
**Manfest Artifact** | `Deployment`

Cliquer sur le bouton **Save Changes**.
