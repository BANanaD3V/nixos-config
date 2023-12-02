{lib, ...}: {
  options.banana-hm = {
    lid.enable = lib.mkEnableOption "Laptop lid";
    touchpad.enable = lib.mkEnableOption "Touchpad";
    backlight.enable = lib.mkEnableOption "Backlight";
    battery.enable = lib.mkEnableOption "Battery";
    bluetooth.enable = lib.mkEnableOption "Bluetooth" // {default = true;}; # Dont need bluetooth on server
  };
}
