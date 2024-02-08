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

    xdg.configFile."rofi/themes/colors.rasi".text = with config.colorScheme.palette; ''
      *{
        accent: #${base07};
       foreground: #${base07};
       background: #${base00};
       background-alt: #${base00};
      }
    '';

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
