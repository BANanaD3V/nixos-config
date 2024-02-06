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

  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;

  programs.home-manager.enable = true;
}
