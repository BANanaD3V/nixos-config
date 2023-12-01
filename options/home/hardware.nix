{lib, ...}: {
  options.banana-hm = {
    backlight.enable = lib.mkEnableOption "Backlight";
    battery.enable = lib.mkEnableOption "Battery";
  };
}
