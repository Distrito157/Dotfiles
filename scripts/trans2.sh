#!/usr/bin/env bash

trans $1:$2 -b "$3" | xclip -selection clipboard
