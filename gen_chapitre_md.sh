#!/bin/bash

# Configuration
CHAPITRES_DIR="chapitres"
BUILD_DIR="builds"
VAULT_DIR="$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/Lycée_OS/60_cours_tle_spe"

# Créer le dossier vault si nécessaire
mkdir -p "$VAULT_DIR"

for texfile in "$CHAPITRES_DIR"/*.tex; do
  base=$(basename "$texfile" .tex)

  # Extraire le titre du chapitre depuis le .tex
  titre=$(grep -m1 '\\chapter{' "$texfile" | sed 's/.*\\chapter{\(.*\)}/\1/')

  # Fallback sur le nom de fichier si pas de titre trouvé
  if [ -z "$titre" ]; then
    titre=$(echo "$base" | sed -E 's/^[0-9]+_//' | sed -E 's/_/ /g')
  fi

  pdf_complet="${base}_complet.pdf"
  pdf_trous="${base}_trous.pdf"

  # Copier les PDFs dans le vault si ils existent
  if [ -f "$BUILD_DIR/$pdf_complet" ]; then
    cp "$BUILD_DIR/$pdf_complet" "$VAULT_DIR/$pdf_complet"
    echo "📄 Copié : $pdf_complet"
  fi
  if [ -f "$BUILD_DIR/$pdf_trous" ]; then
    cp "$BUILD_DIR/$pdf_trous" "$VAULT_DIR/$pdf_trous"
    echo "📄 Copié : $pdf_trous"
  fi

  # Générer la note Obsidian uniquement si elle n'existe pas encore
  mdfile="$VAULT_DIR/$base.md"
  if [ ! -f "$mdfile" ]; then
    cat > "$mdfile" <<EOF
---
Niveau: Terminale
Discipline: ""
Statut: ""
date_traite: ""
tp_lie: ""
Source_LaTeX: "${base}.tex"
tags:
  - Cours
  - Terminale
---

# $titre

- 📘 [[$pdf_complet|Version complète]]
- 📓 [[$pdf_trous|Version à trous]]
EOF
    echo "✅ Note créée : $base.md"
  else
    echo "⏭️  Note existante conservée : $base.md"
  fi
done
