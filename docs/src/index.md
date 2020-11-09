# Optinum - Méthodes numériques pour les problèmes d’optimisation

## Organisation
Le projet d'optimisation numérique est à réalisé par binôme (dans un même groupe de tp). Nous vous laissons vous organniser pour faire ces binômes. Lors des séances de tp, nous passerons 10 à 15 minutes par binôme dans les salons discords dédiés. Nous ne verrons donc pas nécessairement tous les binômes à chaque séance de tp. Durant ces recontres nous ferons un point d'avancement de votre projet et répondrons à vos questions. Ces rencontres seront en partie évalué et ceci entrera dans la notation du projet.

Vous pouvez travaillé sur vos machine, mais vous pouvez aussi travailler sur les machines de l'enseeiht (en utilisant `x2go`

## Introduction
Le package [Optinum](https://github.com/mathn7/Optinum) concerne le projet d’Optimisation Numérique pour l’année 2020-2021 de l'École INP-ENSEEIHT. Pour récupérer le répertoire Optinum et toute la structuration il vous faut cloner ce dépot GitHub. Pour cela, ouvrer une fenêtre de commande et cloner ce dépot (il faut que git soit installé sur votre machine) : 

`git clone https://github.com/mathn7/Optinum.git`

**Il ne faut en aucun cas modifier la structuration** de ce projet, ni les interfaces des fonctions.

Les fichiers `julia` que vous aurez à modifier se trouvent dans le répertoire `Optinum/src`. Ces fichiers sont : 
1. `TP-Projet-Optinum.ipynb`: c'est un julia notebook dans lequel vous ferez toutes vos expérimentations numériques et répondrez aux questions posées. Ce fichier est à ouvrir avec `jupyter notebook`.
2. Les fichiers `julia` qui codent les algorithmes demandés (voir le notebook).

Pour réaliser ce projet, vous avez besoin : 
1. de `julia`, version 1.4.1 ou plus récente;
2. des packages IJulia (pour avoir accès à `jupyter notebook` pour julia)
3. des packages LinearAlgebra, Markdown

###### Auteurs : O.Cots, J. Gergaud, S. Gratton, P. Matalon, C. Royer, D. Ruiz et E. Simon
