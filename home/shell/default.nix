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
  ];
}
