#!/usr/bin/env sh

# Monitor
xrandr --output DisplayPort-0 --primary
xrandr --output HDMI-A-0 --right-of DisplayPort-0
xrandr --output DisplayPort-0 --brightness 1.2

# teclado
setxkbmap -layout br -option caps:swapescape &

# wallpaper / background
~/.fehbg &

# barra superior
~/.config/polybar/launch.sh &

# cursor
xsetroot -cursor_name left_ptr &

# recarregar o .Xresources
xrdb ~/.Xresources

# Startando o flameshot {{{

if pgrep -x "flameshot" > /dev/null; then
  pkill -f "flameshot"
  sleep 2s
fi
flameshot &

# }}}

