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
      eac-workaround.enable = lib.mkEnableOption "Star citizen EAC workaround";
      steam.enable = lib.mkEnableOption "Steam" // {default = config.banana-hm.gaming.enable;};
    };
  };
}
