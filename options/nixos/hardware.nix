{
  lib,
  config,
  ...
}: {
  options.banana = {
    nvidia = {
      drivers = {
        enable = lib.mkEnableOption "Nvidia drivers";
        version = lib.mkOption {
          type = lib.types.enum ["stable" "production" "beta"];
          default = "production";
        };
      };
      hyprland.enable = lib.mkEnableOption "Hyprland nvidia compatibility" // {default = config.banana-hm.hyprland.enable && config.banana-hm.nvidia.drivers.enable;};
    };

    #drives = {
    # soon
    #};
  };
}
