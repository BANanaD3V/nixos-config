{
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    ./zsh
    ./nvim.nix
    ./tmux.nix
    ./kitty.nix
    ./starship.nix
    ./neofetch
  ];
}
