## Stage 1 - Namespace

Le Namespace est la zone dans laquelle l'application est déployée.

### Mise en oeuvre

Cliquer sur le bouton **Add stage**

Compléter le formulaire tels qu'indiqué ci-dessous:

* **Type**: **Deploy (Manifest)**
* **Stage name**: `Namespace`{{copy}}
* **Account**: default
* **Override Namespace**: _Activé_
* **Namepsace**: _USERNAME_`-draw-io-staging`
* **Manifest Source**: Text

Coller, puis _modifier_ la déclaration YAML suivante dans la zone de texte **Manifest**.

```yaml
apiVersion: v1
kind: Namespace
metadata:
  name: USERNAME-drawio-staging
```{{copy}}

## Exemple

```text
apiVersion: v1
kind: Namespace
metadata:
  name: jane-doe-drawio-staging
```

Cliquer sur **Save Changes**.
