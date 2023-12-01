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
  home.file.".config/neofetch/config.conf" = {
    source = ./config.conf;
    recursive = true;
    executable = true;
  };

  home.file.".config/neofetch/logo" = {
    source = ./logo;
    recursive = true;
    executable = true;
  };
}
