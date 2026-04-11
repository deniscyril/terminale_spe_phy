PDFLATEX := '/Library/TeX/texbin/pdflatex'
# === Répertoires ===
CHAPITRES_DIR := chapitres
BUILD_DIR := builds

# === Compilation manuelle : make chapitre=... mode=... build ===
build:
	@echo "PDFLATEX vaut : '$(PDFLATEX)'"
	@if [ -z "$(chapitre)" ] || [ -z "$(mode)" ]; then \
		echo "❌ Erreur : il faut préciser 'chapitre' et 'mode' (complet ou trous)"; \
		echo "➡️ Exemple : make chapitre=chapitre1_acidebase mode=trous build"; \
		exit 1; \
	fi
	TEXINPUTS=.:$(PWD): $(PDFLATEX) -interaction=nonstopmode -jobname=$(chapitre)_$(mode) '\def\mode{$(mode)} \def\fichier{chapitres/$(chapitre).tex} \input{Livre.tex}'
	mkdir -p builds
	mv $(chapitre)_$(mode).pdf builds/
	# Nettoyage des fichiers auxiliaires
	rm -f *.aux *.log *.out *.toc *.nav *.snm *.fls *.fdb_latexmk

# === Compilation de tous les chapitres ===
CHAPITRES := $(basename $(notdir $(wildcard $(CHAPITRES_DIR)/*.tex)))
ALL_PDFS := $(foreach ch, $(CHAPITRES), $(BUILD_DIR)/$(ch)_complet.pdf $(BUILD_DIR)/$(ch)_trous.pdf)

all: $(ALL_PDFS)

$(BUILD_DIR)/%_complet.pdf: $(CHAPITRES_DIR)/%.tex Livre.tex
	TEXINPUTS=.:$(PWD): $(PDFLATEX) -interaction=nonstopmode -jobname=$*_complet "\def\mode{complet} \def\fichier{$<} \input{Livre.tex}"
	mkdir -p $(BUILD_DIR)
	mv $*_complet.pdf $(BUILD_DIR)/

$(BUILD_DIR)/%_trous.pdf: $(CHAPITRES_DIR)/%.tex Livre.tex
	TEXINPUTS=.:$(PWD): $(PDFLATEX) -interaction=nonstopmode -jobname=$*_trous "\def\mode{trous} \def\fichier{$<} \input{Livre.tex}"
	mkdir -p $(BUILD_DIR)
	mv $*_trous.pdf $(BUILD_DIR)/

# === Nettoyage ===
clean:
	rm -f *.aux *.log *.out *.toc *.nav *.snm *.fls *.fdb_latexmk
	rm -rf $(BUILD_DIR)
	