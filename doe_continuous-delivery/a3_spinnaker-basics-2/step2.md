## Stage 1 - Message d'approbation

Dans le schéma du pipeline, sélectionner **Configuration**.

Cliquer sur le bouton **Add stage**, puis compléter le formulaire tels qu'indiqué ci-dessous:

* **Type**: Manual Judgment
* **Stage Name**: `Validate release to production`{{copy}}

Coller, puis _modifier_ le message suivant dans la zone de texte **Instructions**.

```html
Please validate that the staging application cluster look <b>OK</b>. Test and inspect <a href="https://USERNAME-draw-staging.testruction.io">the staging release</a> before approving the release to the production environment.
```

Cliquer sur le bouton **Save Changes**.
