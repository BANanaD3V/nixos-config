{
  pkgs,
  lib,
  inputs,
  ...
}: {
  home = {
    username = "banana";
    homeDirectory = "/home/banana";
    stateVersion = "23.05";
  };

  imports = [
    ./wayland
    ./shell
    ./software
  ];

  programs.home-manager.enable = true;
}
