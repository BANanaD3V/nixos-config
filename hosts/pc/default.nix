{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./drives.nix
    ../../modules/drivers.nix
    # ../../home/wayland
    # ../../home/shell
    # ../../home/software
  ];

  home-manager.users.banana.imports = [
    ../../home/home.nix
    ../../home/wayland
    ../../home/shell
    ../../home/software
  ];
  networking.hostName = "banana-pc"; # Define your hostname.

  # Hyprland and nvidia
  programs.hyprland.enable = true;

  environment.variables = {
    GBM_BACKEND = "nvidia-drm";
    LIBVA_DRIVER_NAME = "nvidia";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    __GL_GSYNC_ALLOWED = "1";
    __GL_VRR_ALLOWED = "0";
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
  };
}
