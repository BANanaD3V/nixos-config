#!/usr/bin/env bash

if [ $1 = "special" ]; then
    if [ "$(hyprctl activewindow -j | jq -r ".workspace.id")" = "-99" ]; then
        hyprctl dispatch movetoworkspace e+0
    else
        hyprctl dispatch movetoworkspace special
    fi
else
    if [ "$(hyprctl activeworkspace -j | jq -r ".monitor")" = "DP-3" ]; then
        hyprctl dispatch movetoworkspace $1
    else
        if [ $1 = "10" ]; then
            hyprctl dispatch movetoworkspace 20
        else
            hyprctl dispatch movetoworkspace 1$1
        fi
    fi
fi
