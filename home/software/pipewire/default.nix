{
  pkgs,
  lib,
  config,
  inputs,
  default,
  ...
}: {
  xdg.configFile."pipewire" = {
    source = ./config;
    recursive = true;
    executable = true;
  };
}
