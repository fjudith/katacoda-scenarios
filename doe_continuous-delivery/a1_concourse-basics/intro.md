# Introduction

Construire une chaîne d'intégration et de livraison continue de [Draw.io](https://draw.io) ciblant un cluster Kubernetes hébergé en Finlande en utilisant respectivement [Concourse](https://concourse-ci.org) pour l'intégration continue et [Spinnaker](https://spinnaker.io) pour le déploiement continue.

## Le logiciel

[Draw.io](https://draw.io) est un logiciel libre et open source en mode Software-as-a-Service dédié à la création de diagrammes comptant plusieurs millions d'utilisateurs.

* **Source code**: https://github.com/jgraph/

## La solution de déploiement privée

Une image OCI est également maintenu pour ceux qui souhaites développer des plugins ou qui n'ont simplement pas la possibilité d'y accéder en dehors du SI de leur entreprise.

* **Source code**: https://github.com/fjudith/docker-draw.io

Ce dépôt est lié à au code source (i.e. https://github.com/jgraph/draw.io) à l'aide d'un module git qui déclenche automatiquement la chaîne d'assemblage des images OCI lorsque les développeurs livrent des mises à jours dans la branche `master` (voir [.gitmodules](./gitmodules)).

## Concourse

Contrairement à Jenkins, Concourse ne possède qu'une interface supervision.
Il n'y a pas de console d'administration.

Coucourse suit la philosphie `pipeline-as-code` introduite en 2011 par [Travis-CI](https://travis-ci.orge).
Par conséquent l'administration se pilote à l'aide de la ligne de commande et de fichiers textes pouvant facilement être versionnés dans Git.
