## Stage 4 - Ingress

Si un service permet de joindre à l'intérieur du cluster, une ressource [Ingress](https://kubernetes.io/docs/concepts/services-networking/ingress/) permet d'exposer publiquement l'application à l'extérieur du cluster.

### Mise en oeuvre

Dans le schéma du pipeline, sélectionner **Service**.

Cliquer sur le bouton **Add stage**

Compléter le formulaire tels qu'indiqué ci-dessous:

> **Attention**: Remplacer _USERNAME_ par votre **`prénom-nom`**.

* **Type**: **Deploy (Manifest)**
* **Stage name**: `Ingress`{{copy}}
* **Depends On**: Service + Deployment
* **Account**: default
* **Override Namespace**: _Activé_
* **Namepsace**: _USERNAME_`-drawio-staging`
* **Manifest Source**: Text

Coller, puis _modifier_ la déclaration YAML suivante dans la zone de texte **Manifest**.

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  annotations:
    cert-manager.io/cluster-issuer: letsencrypt-prod
    kubernetes.io/ingress.class: contour
    kubernetes.io/tls-acme: "true"
  name: drawio
  namespace: drawio
spec:
  rules:
  - host: USERNAME-draw-staging.testruction.io
    http:
      paths:
      - backend:
          service:
            name: drawio
            port:
              number: 8080
        path: /
        pathType: Prefix
  tls:
  - hosts:
    - USERNAME-draw-staging.testruction.io
    secretName: drawio-staging-cert
```{{copy}}

#### Exemple

```text
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  annotations:
    cert-manager.io/cluster-issuer: letsencrypt-prod
    kubernetes.io/ingress.class: nginx
    kubernetes.io/tls-acme: "true"
  name: drawio
  namespace: drawio
spec:
  rules:
  - host: jane-doe-draw-staging.testruction.io
    http:
      paths:
      - backend:
          service:
            name: drawio
            port:
              number: 8080
        path: /
        pathType: Prefix
  tls:
  - hosts:
    - jane-doe-draw-staging.testruction.io
    secretName: drawio-staging-cert
```

Cliquer sur **Save Changes**.