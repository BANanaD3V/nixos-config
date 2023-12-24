{
  pkgs,
  lib,
  inputs,
  username,
  ...
}: {
  home = {
    username = username;
    homeDirectory = "/home/${username}";
    stateVersion = "23.05";
  };

  imports = [
    ./desktop
    ./shell
    ./software
  ];

  programs.home-manager.enable = true;
}
