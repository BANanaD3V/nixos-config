{
  config,
  lib,
  isNixOS,
  ...
}: {
  options.home-manager = {
    hyprland.enable = lib.mkEnableOption "Hyprland" // {default = isNixOS;};
    waybar.enable = lib.mkEnableOption "Waybar" // {default = config.home-manager.hyprland.enable;};
    rofi.enable = lib.mkEnableOption "Rofi" // {default = config.home-manager.hyprland.enable;};
    swaync.enable = lib.mkEnableOption "Sway Notification Center" // {default = config.home-manager.hyprland.enable;};
    displays = lib.mkOption {
      type = with lib.types;
        listOf (
          submodule {
            options = {
              name = lib.mkOption {
                type = str;
                description = "The name of the display, e.g. eDP-1";
              };
              hyprland = lib.mkOption {
                type = str;
                description = ''
                  Hyprland config for the monitor, see
                  https://wiki.hyprland.org/Configuring/Monitors/

                  e.g. 3440x1440@165,0x0,1.25
                '';
              };
              workspaces = lib.mkOption {
                type = listOf int;
                description = "List of workspace strings";
              };
            };
          }
        );
      default = [];
      description = "Config for new displays";
    };
  };
}
