### Supervision

Naviguer vers https://ci.testruction.io pour superviser votre pipeline (i.e "${USERNAME}-draw.io")

Une fois le pipeline terminé, se rendre sur https://hub.docker.com/r/testruction/.
Cliquer sur le bouton **Sign In**, puis entrer le compte suivant:

* Username: `testruction`
* Password: `[[PASSWORD]]`

Sélectionner votre projet (i.e "${USERNAME}-draw.io"), puis consulter les images crées depuis l'onglet **Tags**.
Valider que deux images sont présentes:

1. `alpine`: Image optimisé pour la réduction du stockage
2. `debian`: Image permettant une plus grande personnalisation au prix d'une emprunte de stockage plus importante.