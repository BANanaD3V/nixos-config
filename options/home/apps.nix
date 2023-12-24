{
  config,
  lib,
  isNixOS,
  ...
}: {
  options.home-manager = {
    graphical.enable = lib.mkEnableOption "Graphical environment";
    obs.enable = lib.mkEnableOption "OBS Studio" // {default = isNixOS;};
    kitty.enable = lib.mkEnableOption "Kitty" // {default = isNixOS;};
    tmux.enable = lib.mkEnableOption "Tmux" // {default = true;};
    gaming = {
      enable = lib.mkEnableOption "Gaming";
      eac-workaround.enable = lib.mkEnableOption "Star citizen EAC workaround";
      steam.enable = lib.mkEnableOption "Steam" // {default = config.home-manager.gaming.enable;};
    };
  };
}
