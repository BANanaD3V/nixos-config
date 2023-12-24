{
  pkgs,
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.hm.home-manager.backlight.enable {
    environment.systemPackages = [pkgs.brightnessctl];
  };
}
