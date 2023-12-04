{
  pkgs,
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.hm.banana-hm.backlight.enable {
    environment.systemPackages = [pkgs.brillo];
  };
}
