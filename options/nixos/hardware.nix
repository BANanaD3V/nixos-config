{
  lib,
  config,
  ...
}: {
  options.nixos = {
    nvidia = {
      drivers = {
        enable = lib.mkEnableOption "Nvidia drivers";
        version = lib.mkOption {
          type = lib.types.enum ["latest" "stable" "production" "beta"];
          default = "latest";
        };
      };
      hyprland.enable = lib.mkEnableOption "Hyprland nvidia compatibility" // {default = config.home-manager.hyprland.enable && config.nixos.nvidia.drivers.enable;};
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
