## Stage 4 - Ingress

La configuration du stage [Ingress](https://kubernetes.io/docs/concepts/services-networking/ingress/) doit être modifiée afin de pointer vers l'environnement de production et publié sous son propre nom de domaine.

### Mise en oeuvre

Dans le schéma du pipeline, sélectionner **Ingress**.

Modifier le formulaire tels qu'indiqué ci-dessous:

* **Override Namespace**: _Activé_
* **Namepsace**: _USERNAME_`-drawio`

Remplacer, puis _modifier_ la déclaration YAML suivante dans la zone de texte **Manifest**.

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
  - host: USERNAME-draw.testruction.io
    http:
      paths:
      - backend:
          serviceName: drawio
          servicePort: 8080
        path: /
  tls:
  - hosts:
    - USERNAME-draw.testruction.io
    secretName: drawio-prod-cert
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
  - host: jane-doe-draw.testruction.io
    http:
      paths:
      - backend:
          serviceName: drawio
          servicePort: 8080
        path: /
  tls:
  - hosts:
    - jane-doe-draw.testruction.io
    secretName: drawio-prod-cert
```

Cliquer sur **Save Changes**.