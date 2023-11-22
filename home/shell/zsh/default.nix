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
    zsh
    zsh-autocomplete
    zsh-autosuggestions
    zsh-syntax-highlighting
  ];
}
