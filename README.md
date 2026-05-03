# Notice d'utilisation — Compilation et synchronisation Obsidian

Ce projet contient les sources LaTeX des cours de Terminale spécialité physique-chimie.
Le workflow repose sur trois outils : **`make`** pour compiler les PDF, **`gen_chapitre_md.sh`** pour synchroniser avec le vault Obsidian, et **`cours-sync`** pour tout enchaîner en une seule commande.

---

## Structure du projet

```
chapitres/          ← sources LaTeX de chaque chapitre
builds/             ← PDF générés (complet + trous)
figures/            ← images incluses dans les cours
Livre.tex           ← fichier maître LaTeX
coursprof.cls       ← classe LaTeX personnalisée
Makefile            ← règles de compilation
gen_chapitre_md.sh  ← script de synchronisation Obsidian
cours-sync          ← script tout-en-un (compilation + Obsidian + git)
```

Chaque chapitre produit deux PDF :
- `NOM_complet.pdf` — version professeur avec toutes les réponses
- `NOM_trous.pdf` — version élève avec les espaces à compléter

---

## Workflow rapide avec `cours-sync`

`cours-sync` est le script tout-en-un à utiliser au quotidien. Il enchaîne automatiquement la compilation, la synchronisation Obsidian et la sauvegarde sur GitHub.

### Cas d'usage courant — après modification d'un ou plusieurs chapitres

```bash
bash cours-sync "Mise à jour chapitre 16 thermodynamique"
```

### Sans message personnalisé (message par défaut)

```bash
bash cours-sync
```

Le script effectue dans l'ordre :
1. **`make all`** — recompile uniquement les chapitres modifiés
2. **`gen_chapitre_md.sh`** — copie les PDF dans le vault Obsidian
3. **`git add / commit / push`** — sauvegarde et publie sur GitHub

Le script s'arrête immédiatement si une étape échoue (erreur LaTeX, problème réseau…). S'il n'y a rien à committer, il le signale et pousse quand même.

### Recompilation globale (après changement de `coursprof.cls` ou `Livre.tex`)

```bash
make distclean
make -B all
bash cours-sync "Recompilation globale"
```

---

## Compilation avec `make`

### Mettre à jour un seul chapitre modifié

```bash
make
# ou explicitement :
make all
```

`make` détecte automatiquement quels fichiers `.tex` ont changé et ne recompile **que ceux-là**. C'est le cas d'usage le plus courant après avoir modifié un chapitre.

### Forcer la recompilation de tous les chapitres

```bash
make -B all
```

Utile après une modification de `Livre.tex`, `coursprof.cls`, ou pour s'assurer que tous les PDF sont à jour (par exemple en fin d'année).

### Compiler un seul chapitre manuellement

```bash
make chapitre=13_radioactivite mode=complet build
make chapitre=13_radioactivite mode=trous build
```

Pratique pour tester rapidement un chapitre en cours de rédaction sans attendre la compilation de tous les autres.

### Nettoyer les fichiers auxiliaires LaTeX

```bash
make clean
```

Supprime les `.aux`, `.log`, `.out`, `.toc`, etc. laissés dans le répertoire racine. Normalement inutile car la compilation via `make all` nettoie automatiquement après chaque PDF généré.

### Tout supprimer (PDF inclus)

```bash
make distclean
```

Supprime les fichiers auxiliaires **et** le dossier `builds/`. À utiliser pour repartir de zéro.

---

## Synchronisation avec Obsidian

### Synchroniser après une compilation

```bash
./gen_chapitre_md.sh
```

Le script fait deux choses :
1. **Copie tous les PDF** depuis `builds/` vers le vault Obsidian (iCloud)
2. **Crée une note `.md`** par chapitre si elle n'existe pas encore (les notes existantes ne sont jamais écrasées)

Le vault de destination est :
```
~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Lycée_OS/60_cours_tle_spe
```

### Workflow complet après modification d'un chapitre

```bash
# 1. Compiler uniquement le chapitre modifié
make all

# 2. Synchroniser les PDF dans Obsidian
./gen_chapitre_md.sh
```

### Workflow de recompilation globale (fin d'année, changement de classe)

```bash
# 1. Tout recompiler depuis zéro
make distclean
make -B all

# 2. Synchroniser dans Obsidian
./gen_chapitre_md.sh
```

---

## Versionnement avec Git et GitHub

Le dépôt est hébergé sur : `https://github.com/deniscyril/terminale_spe_phy`

### Ce qui est suivi par git

- Les sources LaTeX (`chapitres/*.tex`, `Livre.tex`, `coursprof.cls`)
- Les PDF compilés dans `builds/`
- Les scripts et le makefile

### Ce qui est ignoré (`.gitignore`)

- Les fichiers auxiliaires LaTeX (`.aux`, `.log`, `.out`, `.toc`…)
- Les PDF en dehors de `builds/` (ex. fichiers temporaires à la racine)
- Les fichiers macOS (`.DS_Store`) et la config locale Obsidian

### Sauvegarder après une modification de chapitre

```bash
git add chapitres/13_radioactivite.tex builds/13_radioactivite_complet.pdf builds/13_radioactivite_trous.pdf
git commit -m "Mise à jour chapitre 13 radioactivité"
git push
```

### Sauvegarder une recompilation globale

```bash
git add builds/
git commit -m "Recompilation de tous les chapitres"
git push
```

### Workflow complet : modifier, compiler, synchroniser, sauvegarder

La manière la plus simple est d'utiliser `cours-sync` (voir section dédiée en haut).

Pour un contrôle manuel étape par étape :

```bash
# 1. Compiler après modification
make all

# 2. Synchroniser dans Obsidian
./gen_chapitre_md.sh

# 3. Versionner et pousser sur GitHub
git add chapitres/ builds/
git commit -m "Mise à jour chapitre XX"
git push
```

### Consulter l'historique

```bash
# Voir les derniers commits
git log --oneline

# Voir ce qui a changé depuis le dernier commit
git diff
git status
```

### Récupérer le projet sur une autre machine

```bash
git clone https://github.com/deniscyril/terminale_spe_phy.git
```

---

## Remarques

- Les **notes Obsidian** (`.md`) ne sont créées qu'une seule fois. Si tu as enrichi une note manuellement, elle sera préservée à chaque synchronisation.
- Les **PDF sont toujours mis à jour** dans Obsidian, même si la note existait déjà.
- Les avertissements LaTeX de type `\headheight too small` ou `Overfull \hbox` sont bénins et n'empêchent pas la génération des PDF.
- Si des références croisées semblent incorrectes dans un PDF, relancer `make -B all` pour une double passe de compilation.
