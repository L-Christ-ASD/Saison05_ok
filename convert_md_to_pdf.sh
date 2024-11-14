#!/bin/bash

# Convert Mardown to PDF
#
# Usage
#
# 1. manage permission
#       `chmod +x md2pdf.sh`
#
# 2. run
#
#   - a specific directory
#       `./md2pdf.sh /path/to/directory` [WARNING: no trailling slash]
#
#   - the current directory
#       `./md2pdf.sh`

# récupère le répertoire source :
#   - soit on a un argument dans la commande
#   - soit le dossier courant
DIRECTORY="${1:-.}" # Utilise le premier argument de la commande ou le répertoire courant (`.`)

# pour chaque « élément » du dossier qui s'appelle XXX.md
for md_file in "$DIRECTORY"/*.md; do
    # on vérifie qu'il s'agit d'un fichier
    if [ -f "$md_file" ]; then
        # on récupère son nom (sans l'extension)
        filename=$(basename "$md_file" .md)

        # on lance le convertisseur à l'aide de l'image Docker
        docker run --rm -v "${PWD}:/app" yjpictures/mdpdfinator "$DIRECTORY/$filename.md" -o "$DIRECTORY/$filename.pdf"

        echo "Conversion de '$md_file' terminée avec succès"
    else
        echo "Aucun fichier Markdown trouvé dans le dossier $DIRECTORY"
    fi
done