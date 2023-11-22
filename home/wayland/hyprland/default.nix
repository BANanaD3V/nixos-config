{
  inputs,
  lib,
  pkgs,
  self,
  ...
}: {
  imports = [
    ./config.nix
    ./hyprpaper.nix
  ];

  home.packages = with pkgs; [
    swaynotificationcenter
  ];

  # Import scripts
  home.file.".config/hypr/scripts" = {
    source = ./scripts;
    recursive = true;
    executable = true;
  };

  # Import wallpaper

  home.file.".config/wallpapers" = {
    source = ./wallpapers;
    recursive = true;
    executable = false;
  };

  # start swayidle as part of hyprland, not sway
  # systemd.user.services.swayidle.Install.WantedBy = lib.mkForce ["hyprland-session.target"];

  # enable hyprland
  wayland.windowManager.hyprland.enable = true;
}
