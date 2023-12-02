{
  pkgs,
  lib,
  config,
  inputs,
  default,
  ...
}: {

  home.file.".config/pipewire" = {
    source = ./config;
    recursive = true;
    executable = true;
  };
}
