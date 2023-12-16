{
  lib,
  config,
  pkgs,
  ...
}: {
  # Hyprland and nvidia
  programs.hyprland = {
    enable = true;
  };

  banana = {
    nvidia = {
      drivers.enable = true;
      hyprland.enable = false;
    };
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
  };
}
