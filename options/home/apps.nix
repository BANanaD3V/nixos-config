{
  config,
  lib,
  isNixOS,
  ...
}: {
  options.banana-hm = {
    obs.enable = lib.mkEnableOption "OBS Studio" // {default = isNixOS;};
    kitty.enable = lib.mkEnableOption "Kitty" // {default = isNixOS;};
    gaming = {
      enable = lib.mkEnableOption "Gaming";
      steam.enabled = lib.mkEnableOption "Steam" // {default = true;};
    };
  };
}
