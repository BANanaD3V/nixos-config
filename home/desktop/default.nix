{
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    ./hyprland
    ./rofi
    ./xdg.nix
    ./waybar
  ];
}
