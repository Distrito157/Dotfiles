#!/bin/bash

# Diretório onde as capturas de tela serão salvas
DIR_CAPTURAS=~/capturas_de_tela_bspwm

# Nome do arquivo para a captura de tela única
FILENAME="$DIR_CAPTURAS/all_workspaces.png"

# Espere pelo atraso
ATRASO=2

# Nome do primeiro monitor desejado
PRIMEIRO_MONITOR="DisplayPort-0"

# Obter as dimensões do monitor desejado usando xrandr
MONITOR_INFO=$(xrandr --query | grep "$PRIMEIRO_MONITOR")
MONITOR_WIDTH=$(echo "$MONITOR_INFO" | awk '{print $4}' | cut -d "x" -f 1)
MONITOR_HEIGHT=$(echo "$MONITOR_INFO" | awk '{print $4}' | cut -d "x" -f 2)

# Lista de áreas de trabalho no primeiro monitor (ajuste conforme necessário)
PRIMEIRO_MONITOR_WORKSPACES="1 2 3 4"

# Crie um diretório para armazenar as capturas temporárias
TEMP_DIR=$(mktemp -d)

# Função para alternar para uma área de trabalho específica
alternar_area_de_trabalho() {
    workspace="$1"
    bspc desktop -f ^$workspace
    sleep $ATRASO
}

# Capture cada área de trabalho no primeiro monitor e salve temporariamente
for ws in $PRIMEIRO_MONITOR_WORKSPACES; do
    # Alterne para a área de trabalho
    alternar_area_de_trabalho "$ws"

    # Espere pelo atraso
    sleep $ATRASO

    # Nome do arquivo temporário para a captura de tela
    TEMP_FILENAME="$TEMP_DIR/workspace_$ws.png"

    # Use o import para tirar a captura de tela do tamanho do monitor
    import -window root -crop "$MONITOR_WIDTH"x"$MONITOR_HEIGHT"+0+0 "$TEMP_FILENAME"
done

# Crie uma imagem única combinando todas as capturas
montage -mode concatenate -tile 1x $(ls "$TEMP_DIR"/workspace_*.png) "$FILENAME"

# Remova as capturas temporárias
rm -rf "$TEMP_DIR"

echo "Captura de tela das áreas de trabalho do monitor $PRIMEIRO_MONITOR concluída e salva em $FILENAME."
