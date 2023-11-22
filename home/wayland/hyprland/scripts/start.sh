#!/usr/bin/env bash

hyprpaper &
wl-paste --type text --watch cliphist store &
wl-paste --type image --watch cliphist store &
xwaylandvideobridge &
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &
swaync &
nm-applet &
blueman-applet &
sleep 1 && waybar &
