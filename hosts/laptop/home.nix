{
  lib,
  config,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland = {
    enableNvidiaPatches = lib.mkForce false;

    settings.env = [
      "WLR_DRM_DEVICES,/dev/dri/card1"
    ];
  };

  banana-hm = {
    graphical.enable = true;
    displays = [
      {
        name = "eDP-1";
        hyprland = "1920x1080@144,0x0,1.1";
        workspaces = [1 2 3 4 5 6 7 8 9 10];
      }
    ];
    hyprland.enable = true;
    lid.enable = true;
    touchpad.enable = true;
    battery.enable = true;
    backlight.enable = true;
    gaming.enable = true;
  };
  wayland.windowManager.hyprland.settings = {
  };
}
