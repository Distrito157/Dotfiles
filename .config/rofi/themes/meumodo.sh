#!/usr/bin/env bash

if [ -z "$1" ]; then
  ls ~/Downloads/
else
  feh --bg-fill ~/Downloads/$1
fi
