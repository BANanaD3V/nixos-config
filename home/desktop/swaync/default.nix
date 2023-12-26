{
  pkgs,
  lib,
  config,
  inputs,
  default,
  ...
}: {
  config = lib.mkIf config.home-manager.swaync.enable {
    xdg.configFile."swaync" = {
      source = ./config;
      recursive = true;
      executable = true;
    };

    home.packages = with pkgs; [
      swaynotificationcenter
    ];
  };
}
