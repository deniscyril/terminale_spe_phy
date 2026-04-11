# 📚 Table des matières — Cours Terminale

Liste automatique des chapitres PDF :

```dataview
table titre as "Titre", 
      "[Complet](../builds/" + fichier_pdf + "_complet.pdf)" as "Complet", 
      "[Trous](../builds/" + fichier_pdf + "_trous.pdf)" as "Trous"
from "chapitres_md"
sort fichier_pdf

```
