{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  config = lib.mkIf config.home-manager.rofi.enable {
    xdg.configFile."rofi/configs" = {
      source = ./config;
      recursive = true;
      executable = true;
    };

    xdg.configFile."rofi/themes" = {
      source = ./themes;
      recursive = true;
      executable = true;
    };

    home.packages = with pkgs; [
      keepmenu
      rofi-rbw
      rbw
      pinentry
      rofimoji
    ];

    programs.rofi = {
      enable = true;
      plugins = with pkgs; [rofi-calc];
      package = pkgs.rofi-wayland;
      theme = "~/.config/rofi/configs/config.rasi";
    };
  };
}
