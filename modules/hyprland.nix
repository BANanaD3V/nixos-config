{
lib,
host,
pkgs,
config,
inputs,
system,
username,
...
}:
{
  programs.hyprland.enable = config.hm.home-manager.hyprland.enable;
}
