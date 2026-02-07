#!/usr/bin/env bash

progress-bar() {
    local current=$1 # primeiro argumento $((i+1))
    local len=$2 # segundo argumeto $len

    local length=50 # tamanho da barra
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

    # -n para "no new line" e -e para interpretar o \r
    echo -ne "$s $current/$len ($perc_done%)\r"
}

process-file(){
    local file=$1

    sleep .01
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
    process-file "$file"

    ((i++))
done

echo