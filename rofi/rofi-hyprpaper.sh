#!/usr/bin/env bash

wallpaper_folder="$HOME/Imágenes/wallpapers"

# Seleccionar archivo o subdirectorio
selection=$(ls "$wallpaper_folder" | rofi -dmenu -hover-select -p "Elige fondo o carpeta")

[ -z "$selection" ] && exit 1

path="$wallpaper_folder/$selection"

# Si es carpeta, seleccionar imagen dentro
if [[ -d "$path" ]]; then
  image=$(ls "$path" | rofi -dmenu -hover-select -p "Elige imagen")
  [ -z "$image" ] && exit 1
  full_path="$path/$image"
elif [[ -f "$path" ]]; then
  full_path="$path"
else
  echo "Selección inválida"
  exit 1
fi

# Iniciar swww-daemon si no está corriendo
pgrep -x swww-daemon >/dev/null || swww-daemon &
sleep 0.3

# Aplicar fondo con transición
swww img "$full_path" --transition-type any --transition-step 90 --transition-fps 60
