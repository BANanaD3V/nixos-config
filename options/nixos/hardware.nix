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
      hyprland.enable = lib.mkEnableOption "Hyprland nvidia compatibility" // {default = config.banana-hm.hyprland.enable && config.banana.nvidia.drivers.enable;};
    };

    drives = lib.mkOption {
      type = with lib.types;
        listOf (
          submodule {
            options = {
              label = lib.mkOption {
                type = str;
                description = "Drive label";
              };
              mountpoint = lib.mkOption {
                type = str;
                description = "Drive mountpoint";
              };
              fstype = lib.mkOption {
                type = str;
                description = "Drive filesystem type";
              };
            };
          }
        );
      default = [];
      description = "Optional drives";
    };
  };
}
