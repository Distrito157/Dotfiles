#!/usr/bin/env bash

# depende do inotify-utils para funcionar


# Seu diretório de programas
diretorio="$HOME/cpp/fundamentos/ponteiros/"

#  TODO: Deixar o programa dinamicamente
while true; do
  inotifywait -e modify $diretorio/ponteiro.cpp
  g++ $diretorio/ponteiro.cpp -o $diretorio/ponteiro
done
