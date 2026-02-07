#!/usr/bin/env bash

# ativa globstar para busca recursiva (**)
# nullglob para se n encontrar nada, criar um array vazio
shopt -s globstar nullglob
echo "finding files"
# busca tudo com final "cache"
files=(./**/*cache)
# armazena a quantidade de arquivos encontrados
len=${#files[@]}

echo "found $len files"