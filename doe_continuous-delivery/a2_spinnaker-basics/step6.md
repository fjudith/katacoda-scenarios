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
* **Required Artifact to Bind**: **container**
* **Manifest Source**: Text

Coller la déclaration YAML suivante dans la zone de texte **Manifest**.

> **Attention**: Remplacer _USERNAME_ par votre **`prénom-nom`**.

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: drawio
  namespace: drawio
spec:
  replicas: 2
  selector:
    matchLabels:
      app: draw.io
  template:
    metadata:
      labels:
        app: draw.io
    spec:
      containers:
        - image: harbor.testruction.io/USERNAME/draw.io
          imagePullPolicy: IfNotPresent
          name: drawio
          resources:
            limits:
              cpu: 200m
              memory: 512Mi
            requests:
              cpu: 50m
              memory: 128Mi
          ports:
            - containerPort: 8080
```{{copy}}

Cliquer sur le bouton **Save Changes**.