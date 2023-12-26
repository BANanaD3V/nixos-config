{
  inputs,
  lib,
  pkgs,
  self,
  ...
}: {
  home.packages = with pkgs; [
    neofetch
  ];

  # Import config
  xdg.configFile."neofetch/config.conf" = {
    source = ./config.conf;
    recursive = true;
    executable = true;
  };

  xdg.configFile."neofetch/logo" = {
    source = ./logo;
    recursive = true;
    executable = true;
  };
}
