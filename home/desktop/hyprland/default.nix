{
  inputs,
  config,
  lib,
  pkgs,
  self,
  ...
}: {
  imports = [
    ./config.nix
    ./scripts
    ./hyprpaper.nix
  ];

  home.packages = with pkgs; [
    xwaylandvideobridge
    libnotify
  ];

  # Import wallpaper

  xdg.configFile."wallpapers" = {
    source = ./wallpapers;
    recursive = true;
    executable = false;
  };

  # Xresources
  xresources.properties = {
    "Xcursor.size" = 24;
    "Xft.antialias" = 1;
    "Xft.hinting" = 1;
    "Xft.hintstyle" = "hintslight";
    "Xft.rgba" = "rgb";
  };

  # start swayidle as part of hyprland, not sway
  # systemd.user.services.swayidle.Install.WantedBy = lib.mkForce ["hyprland-session.target"];

  # enable hyprland
  wayland.windowManager.hyprland.enable = true;
}
