#!/usr/bin/env bash

progress-bar() {
    local current=$1 # primeiro argumento $((i+1))
    local len=$2 # segundo argumeto $len

    local length=50
    local perc_done=$((current * 100 / len))
    local num_bars=$((perc_done * length / 100))

    local i
    local s='['
    for ((i = 0; i < num_bars; i++)); do
        s+='|'
    done
    for ((i = num_bars; i < length; i++)); do
        s+=' '
    done
    s+=']'

    echo "$s $current/$len ($perc_done%)"

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