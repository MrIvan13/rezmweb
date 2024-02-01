#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Uso: $0 <url>"
    exit 1
fi

url=$1

# Obtener el contenido HTML de la página web
html_content=$(curl -s "$url")

# Extraer títulos (h1)
titulos=$(echo "$html_content" | grep -o '<h1>[^<]*</h1>' | sed 's/<[^>]*>//g')

# Extraer párrafos (p)
parrafos=$(echo "$html_content" | grep -o '<p>[^<]*</p>' | sed 's/<[^>]*>//g')

# Extraer enlaces (a)
enlaces=$(echo "$html_content" | grep -o '<a[^>]*>[^<]*</a>' | sed -n 's/.*href="\([^"]*\)".*/\1/p')

# Imprimir la información de manera ordenada
echo "Títulos:"
echo "$titulos"

echo -e "\nPárrafos:"
echo "$parrafos"

echo -e "\nEnlaces:"
echo "$enlaces"
