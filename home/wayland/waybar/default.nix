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

  home.packages = with pkgs; [
    networkmanagerapplet
    blueman
  ];

  programs.waybar = {
    enable = true;
    # package = inputs.waybar.packages.${pkgs.system}.default;
    settings = config;
    style = style;
  };
}
