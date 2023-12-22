{
  lib,
  config,
  pkgs,
  ...
}: {
  banana = {
    nvidia = {
      drivers.enable = true;
      hyprland.enable = false;
    };
  };
}
