#!/bin/env bash

# Diretório que contém suas imagens de papel de parede
wallpaper_dir="$HOME/Images/"

# Lista de arquivos de imagem no diretório
wallpapers=("$wallpaper_dir"/*)

# Escolha aleatoriamente um papel de parede da lista
random_wallpaper="${wallpapers[RANDOM % ${#wallpapers[@]}]}"

# Verifica se o arquivo de imagem existe
if [ -f "$random_wallpaper" ]; then
    # Configura o papel de parede usando o feh
    feh --bg-fill "$random_wallpaper"

    # Exibe uma notificação para indicar a mudança do papel de parede (opcional)
    notify-send "Papel de parede alterado para $random_wallpaper"
else
    # Se o arquivo de imagem não existir, exibe uma mensagem de erro
    echo "Erro: O arquivo de imagem não foi encontrado em $random_wallpaper"
    notify-send "Erro: O arquivo de imagem não foi encontrado em $random_wallpaper"
fi
