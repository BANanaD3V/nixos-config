{
  config,
  pkgs,
  ...
}: {
  banana-hm = {
    lid.enable = false;
    touchpad.enable = false;
    hyprland.enable = true;
    battery.enable = false;
    backlight.enable = false;
    gaming = {
      enable = true;
      steam.enable = true;
    };
  };
  # xresources.properties = {
  #   "Xft.dpi" = 120;
  # };
}
