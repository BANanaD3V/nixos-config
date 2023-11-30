{
  inputs,
  lib,
  pkgs,
  self,
  ...
}: {
  imports = [
    ./config.nix
  ];

  home.packages = with pkgs; [
    starship
  ];
}
