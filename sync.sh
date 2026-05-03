#!/bin/bash
# sync.sh — Compile, synchronise Obsidian, commit et push
# Usage : bash sync.sh "message de commit"
#         bash sync.sh              (message par défaut)

set -e  # arrête le script à la première erreur

MSG="${1:-Mise à jour des cours}"

echo "=== 1/3 Compilation des PDFs ==="
make all

echo ""
echo "=== 2/3 Synchronisation Obsidian ==="
bash gen_chapitre_md.sh

echo ""
echo "=== 3/3 Commit et push ==="
git add chapitres/ builds/ figures/

if git diff --cached --quiet; then
    echo "Rien à committer."
else
    git commit -m "$MSG"
fi

git push

echo ""
echo "=== Terminé ! ==="
