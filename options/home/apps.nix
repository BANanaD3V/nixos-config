{
  config,
  lib,
  host,
  ...
}: {
  options.home-manager = {
    graphical.enable = lib.mkEnableOption "Graphical environment";
    obs.enable = lib.mkEnableOption "OBS Studio" // {default = config.home-manager.graphical.enable;};
    kitty.enable = lib.mkEnableOption "Kitty" // {default = config.home-manager.graphical.enable;};
    tmux.enable = lib.mkEnableOption "Tmux" // {default = true;};
    gaming = {
      enable = lib.mkEnableOption "Gaming" // {default = host != "server";};
      star-citizen.enable = lib.mkEnableOption "Star citizen" // {default = config.home-manager.gaming.enable && host == "desktop";};
      steam.enable = lib.mkEnableOption "Steam" // {default = config.home-manager.gaming.enable;};
    };
  };
}
