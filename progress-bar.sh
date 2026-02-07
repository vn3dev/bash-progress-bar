#!/usr/bin/env bash

progress-bar() {
    local i=$1 # primeiro argumento $((i+1))
    local len=$2 # segundo argumeto $len

    echo "processing $1/$len"
}

# ativa globstar para busca recursiva (**)
# nullglob para se n encontrar nada, criar um array vazio
shopt -s globstar nullglob
echo "finding files"
# busca tudo com final "cache"
files=(./**/*cache)
# armazena a quantidade de arquivos encontrados
len=${#files[@]}
echo "found $len files"

i=0
for file in "${files[@]}"; do
    # chama function passando os 2 argumentos
    progress-bar "$((i+1))" "$len"

    ((i++))
done