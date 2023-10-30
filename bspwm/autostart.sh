#!/usr/bin/env sh

#Caracterexrandr --output DisplayPort-0 xrandr --output DisplayPort-0 --primary --mode 1366x768 --rotate normal --output HDMI-A-0 --mode 1024x768 --rotate normal --right-of DisplayPort-0
xrandr --output DisplayPort-0 --primary
xrandr --output HDMI-A-0 --right-of DisplayPort-0
xrandr --output DisplayPort-0 --brightness 1.2
setxkbmap -layout br -option caps:swapescape &
~/.fehbg &
~/.config/polybar/launch.sh &
xsetroot -cursor_name left_ptr &
xrdb ~/.Xresources
# picom &
# conky -c ~/.config/conky/Mintaka/Mintaka.conf &
# flameshot
