## Stage 4 - Ingress

Si un service permet de joindre à l'intérieur du cluster, une ressource [Ingress](https://kubernetes.io/docs/concepts/services-networking/ingress/) permet d'exposer publiquement l'application à l'extérieur du cluster.

### Mise en oeuvre

Dans le schéma du pipeline, sélectionner **Service**.

Cliquer sur le bouton **Add stage**

Compléter le formulaire tels qu'indiqué ci-dessous:


* **Type**: **Deploy (Manifest)**
* **Stage name**: `Ingress`{{copy}}
* **Account**: default
* **Depends On**: Service + Deployment
* **Manifest Source**: Text

Coller, puis modifier la déclaration YAML suivante dans la zone de texte **Manifest**.

```yaml
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
  - host: USERNAME-draw-staging.testruction.io
    http:
      paths:
      - backend:
          serviceName: drawio
          servicePort: 8080
        path: /
  tls:
  - hosts:
    - USERNAME-draw-staging.testruction.io
    secretName: drawio-staging-cert
```{{copy}}

## Exemple

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
          serviceName: drawio
          servicePort: 8080
        path: /
  tls:
  - hosts:
    - jane-doe-draw-staging.testruction.io
    secretName: drawio-staging-cert
```

Cliquer sur **Save Changes**.