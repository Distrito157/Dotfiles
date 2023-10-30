#!/usr/bin/env bash

if [ -z "$1" ]; then
  ls ~/Images/
else
  feh --bg-fill ~/Images/$1
fi
