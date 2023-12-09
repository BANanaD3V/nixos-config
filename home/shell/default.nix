{
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    ./zsh
    ./nvim
    ./tmux
    ./kitty
    ./starship
    ./neofetch
  ];
}
