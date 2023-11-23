{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./drives.nix
    ../../modules/drivers.nix
    # ../../home/wayland
    # ../../home/shell
    # ../../home/software
  ];

  home-manager.users.banana.imports = [
    ../../home
    ../../home/wayland
    ../../home/shell
    ../../home/software
  ];
  networking.hostName = "banana-laptop"; # Define your hostname.

  # Hyprland and nvidia
  programs.hyprland = {
    enable = true;
  };

  home-manager.users.banana.wayland.windowManager.hyprland.settings = {
    monitor = [
      "eDP-1,1920x1440@144,0x0,1"
    ];
    env = [
      "XCURSOR_SIZE,24"
    ];
  };

  home-manager.users.banana.programs.waybar.settings.mainBar."hyprland/workspaces".persistent_workspaces = {
    "1" = ["eDP-1"];
    "2" = ["eDP-1"];
    "3" = ["eDP-1"];
    "4" = ["eDP-1"];
    "5" = ["eDP-1"];
    "6" = ["eDP-1"];
    "7" = ["eDP-1"];
    "8" = ["eDP-1"];
    "9" = ["eDP-1"];
    "10" = ["eDP-1"];
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
