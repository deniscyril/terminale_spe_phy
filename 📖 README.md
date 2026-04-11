---
title: README - Projet Cours Terminale
tags: [organisation, latex, cours, physique-chimie]
type: documentation
created: 2025-04-15
---

# 📘 Projet Cours Terminale Spécialité Physique-Chimie

Ce dossier contient l'ensemble des ressources LaTeX et PDF pour le cours de Terminale spécialité physique-chimie. Voici le rôle des fichiers principaux :

---

## ⚙️ `Makefile`

Ce fichier permet d'automatiser la compilation des chapitres.  
Il gère deux **modes de compilation** :

- `complet` : version complète du chapitre, avec tous les contenus visibles
- `trous` : version "à trous" destinée aux élèves, avec certains éléments masqués

### Commandes utiles :
- Compiler un chapitre donné :  
  ```bash
  make chapitre=nom_du_chapitre mode=complet build
  ```
- Compiler **tous** les chapitres (deux versions pour chacun) :  
  ```bash
  make all
  ```
- Nettoyer les fichiers auxiliaires :  
  ```bash
  make clean
  ```

---

## 🧪 `work.tex`

Fichier de travail temporaire pour **concevoir ou tester un seul chapitre**.  
Tu peux l’ouvrir avec **TeXShop** ou **Texifier** pour éditer et compiler rapidement une section sans passer par le `Makefile`.

Contient une ligne comme :
```latex
\def\mode{trous}  % ou complet
\defichier{chapitres/monchapitre.tex}
\input{Livre.tex}
```

---

## 📚 `Livre.tex`

Fichier principal de compilation. Il contient la structure commune à **tous les chapitres**, comme les entêtes, packages, définition de macros, etc.  
Les chapitres sont injectés dynamiquement via `\input{ichier}` pour être compilés individuellement en fonction du mode (`complet` ou `trous`).

---

## 📘 `Livre_complet.tex`

Ce fichier génère **l'intégralité du cours** sous forme de livre, avec :

- une **page de garde** (titre + date)
- une **table des matières**
- un enchaînement de tous les chapitres listés manuellement

Le mode est défini en tête de fichier :
```latex
\def\mode{complet}  % ou trous
```

Il est conçu pour compiler directement via un éditeur LaTeX (Texifier, TeXShop, etc.), sans passer par `make`.

---

## 📁 Dossiers

- `chapitres/` : fichiers source `.tex` des chapitres
- `builds/` : fichiers `.pdf` générés par le Makefile (une version *complet* et une *trous* pour chaque chapitre)
- `figures/` : images utilisées dans les cours
- `chapitres_md/` (optionnel) : version `.md` des chapitres pour intégration dans Obsidian

---

## ✅ Conseils

- Pour une compilation simplifiée avec interaction graphique, utilise **Raycast** avec le script `compiler_chapitre.sh`
- Pour explorer les PDF et liens de manière structurée, tu peux intégrer `builds/` à Obsidian via un lien symbolique.

---
