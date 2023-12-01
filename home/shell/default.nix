{
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    ./zsh
    ./nvim
    ./kitty
    ./starship
    ./neofetch
  ];
}
