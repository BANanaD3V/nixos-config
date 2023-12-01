{
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./drives.nix
    ../../modules/nvidia.nix
    ../../options/nixos
  ];

  home-manager.users.banana.imports = [
    ./home.nix
    ../../options/home
  ];
  networking.hostName = "banana-pc"; # Define your hostname.

  # Hyprland and nvidia
  programs.hyprland = {
    enable = true;
  };

  # services.xserver.displayManager.autoLogin = {
  #   user = "banana";
  #   enable = true;
  # };

  banana = {
    battery.enable = false;
    backlight.enable = false;
  };

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
