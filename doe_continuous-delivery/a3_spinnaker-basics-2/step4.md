## Stage 1 - Namespace

La configuration du stage [Namespace](https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/) doit être modifiée afin de pointer vers l'environnement de production.

### Mise en oeuvre

Dans le schéma du pipeline, sélectionner **Namespace**.

Modifier le formulaire tels qu'indiqué ci-dessous:

* **Override Namespace**: _Activé_
* **Namepsace**: _USERNAME_`-drawio`

Remplacer, puis _modifier_ la déclaration YAML suivante dans la zone de texte **Manifest**.

```yaml
apiVersion: v1
kind: Namespace
metadata:
  name: USERNAME-drawio
```{{copy}}

#### Exemple

```text
apiVersion: v1
kind: Namespace
metadata:
  name: jane-doe-drawio
```

Cliquer sur **Save Changes**.
