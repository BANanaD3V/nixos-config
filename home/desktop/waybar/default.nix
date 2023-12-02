{
  pkgs,
  lib,
  config,
  inputs,
  default,
  ...
}:
with lib; let
  cfg = import ./config.nix {inherit lib config;};
  style = import ./style.nix;
in {
  config = lib.mkIf config.banana-hm.rofi.enable {
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
      settings = cfg;
      style = style;
    };
  };
}
