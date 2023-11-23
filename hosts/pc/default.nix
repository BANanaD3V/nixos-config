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
  networking.hostName = "banana-pc"; # Define your hostname.

  # Hyprland and nvidia
  programs.hyprland = {
    enable = true;
  };

  home-manager.users.banana.programs.waybar.settings.mainBar."hyprland/workspaces".persistent_workspaces = {
    "1" = ["DP-3"];
    "2" = ["DP-3"];
    "3" = ["DP-3"];
    "4" = ["DP-3"];
    "5" = ["DP-3"];
    "6" = ["DP-3"];
    "7" = ["DP-3"];
    "8" = ["DP-3"];
    "9" = ["DP-3"];
    "10" = ["DP-3"];
    "11" = ["DP-1"];
    "12" = ["DP-1"];
    "13" = ["DP-1"];
    "14" = ["DP-1"];
    "15" = ["DP-1"];
    "16" = ["DP-1"];
    "17" = ["DP-1"];
    "18" = ["DP-1"];
    "19" = ["DP-1"];
    "20" = ["DP-1"];
  };

  home-manager.users.banana.wayland.windowManager.hyprland.settings = {
    monitor = [
      "DP-3,3440x1440@165,0x0,1.25"
      "DP-1,2560x1440@144,2752x0,1.25"
    ];
    env = [
      "XCURSOR_SIZE,24"
      "GDK_SCALE,2"
    ];
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
