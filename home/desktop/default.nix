{
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    ./hyprland
    ./rofi
    ./waybar
  ];
}
