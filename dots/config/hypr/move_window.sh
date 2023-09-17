#!/usr/bin/env bash

if [ "$(hyprctl activeworkspace -j | jq -r ".monitor")" = "DP-3" ]; then
    hyprctl dispatch movetoworkspace $1
else
    echo "2"
    if [ $1 = "10" ]; then
      hyprctl dispatch movetoworkspace 20
    else
      hyprctl dispatch movetoworkspace 1$1
    fi
fi
