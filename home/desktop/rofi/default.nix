{
  pkgs,
  lib,
  config,
  inputs,
  default,
  ...
}:
with lib; let
 inherit (config.lib.formats.rasi) mkLiteral;
  rofi_config = import ./config.nix {inherit lib config;};
in {

  home.file.".config/rofi/configs" = {
    source = ./config;
    recursive = true;
    executable = true;
  };

  home.file.".config/rofi/themes" = {
    source = ./themes;
    recursive = true;
    executable = true;
  };

  home.packages = with pkgs; [
    keepmenu
    rofimoji
  ];

  programs.rofi = {
    enable = true;
    plugins = with pkgs; [ rofi-calc ];
    package = pkgs.rofi-wayland;
    theme = "~/.config/rofi/configs/config.rasi";
  };
}
