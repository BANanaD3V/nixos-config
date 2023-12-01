{
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ../../home
  ];

  wayland.windowManager.hyprland = {
    enableNvidiaPatches = lib.mkForce false;

    settings.env = [
      "WLR_DRM_DEVICES,/dev/dri/card1"
    ];
  };

  banana-hm = {
    displays = [
      {
        name = "eDP-1";
        hyprland = "1920x1080@144,0x0,1.1";
        workspaces = [1 2 3 4 5 6 7 8 9 10];
      }
    ];
  };
  wayland.windowManager.hyprland.settings = {
    gestures = {
      workspace_swipe = true;
    };

    bindl = [
      ",switch:Lid Switch, exec, gtklock"
    ];
  };
}
