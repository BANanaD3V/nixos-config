{
  pkgs,
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.banana.backlight.enable {
    environment.systemPackages = [pkgs.brightnessctl];

    hm = {...} @ hmCfg: {
      # add keybinds for backlight
      wayland.windowManager.hyprland.settings = {
        bind = [
          ",XF86MonBrightnessDown, exec, brightnessctl set 5%-"
          ",XF86MonBrightnessUp, exec, brightnessctl set +5%"
        ];
      };
    };
  };
}
