{
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    ./hyprland
    ./rofi
    ./swaync
    ./xdg.nix
    ./waybar
  ];
}
