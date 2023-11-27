{
  lib,
  config,
  ...
}: {
  options.banana = {
    backlight.enable = lib.mkEnableOption "Backlight";
    battery.enable = lib.mkEnableOption "Battery";
    nvidia.enable = lib.mkEnableOption "Nvidia GPU";
    wifi.enable = lib.mkEnableOption "Wifi";
    #drives = {
    # soon
    #};
  };
}
