#!/usr/bin/env bash

hyprpaper &
wl-paste --type text --watch cliphist store &
wl-paste --type image --watch cliphist store &
xwaylandvideobridge &
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &
xrandr --output DP-3 --primary &
sleep 1 && waybar &
