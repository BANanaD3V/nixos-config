{
  inputs,
  lib,
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

  colorScheme = {
    slug = "catppuccin-mocha";
    name = "Catppuccin Mocha";
    author = "Catppuccin";
    palette = {
      base00 = "#181825";
      base01 = "#1e1e2e";
      base02 = "#313244";
      base03 = "#45475a";
      base04 = "#585b70";
      base05 = "#cdd6f4";
      base06 = "#f5e0dc";
      base07 = "#b4befe";
      base08 = "#f38ba8";
      base09 = "#fab387";
      base0A = "#f9e2af";
      base0B = "#a6e3a1";
      base0C = "#94e2d5";
      base0D = "#89b4fa";
      base0E = "#cba6f7";
      base0F = "#f2cdcd";
    };
  };
  # colorScheme = inputs.nix-colors.colorSchemes.material-darker;
  programs.home-manager.enable = true;
}
