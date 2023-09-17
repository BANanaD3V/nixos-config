{
  pkgs,
  lib,
  config,
  inputs,
  default,
  ...
}:
with lib; let
  config = import ./config.nix {inherit config lib pkgs;};
  style = import ./style.nix;
in {
  home.file.".config/waybar/scripts" = {
    source = ./scripts;
    recursive = true;
    executable = true;
  };

  programs.waybar = {
    enable = true;
    # package = inputs.hyprland.packages.${pkgs.system}.waybar-hyprland;
    settings = config;
    style = style;
  };
}
