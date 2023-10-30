#!/usr/bin/env sh

# Bspc Rules {{{

#  NOTE: Estados = { tiled, floating, fullscreen }

bspc rule -a Gimp desktop='^3' state=fullscreen follow=off
bspc rule -a Chromium desktop='^6' state=fullscreen focus=on
bspc rule -a 'feh' state=floating

# }}}
