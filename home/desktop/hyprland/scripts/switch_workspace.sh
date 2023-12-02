#!/usr/bin/env bash

if [ "$(hyprctl activeworkspace -j | jq -r ".monitor")" = "DP-3" ]; then
    hyprctl dispatch workspace $1
elif [ "$(hyprctl activeworkspace -j | jq -r ".monitor")" = "DP-1" ];  then
    echo "2"
    if [ $1 = "10" ]; then
      hyprctl dispatch workspace 20
    else
      hyprctl dispatch workspace 1$1
    fi
elif [ "$(hyprctl activeworkspace -j | jq -r ".monitor")" = "eDP-1" ]; then
    hyprctl dispatch workspace $1
fi
