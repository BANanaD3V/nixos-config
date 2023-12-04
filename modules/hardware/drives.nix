{
  lib,
  config,
  ...
}: {
  # Main driv
  config = lib.mkMerge [
    {
      fileSystems = {
        "/" = {
          device = "/dev/disk/by-label/NIXOS";
          fsType = "btrfs";
          options = ["subvol=@"];
        };

        "/boot" = {
          device = "/dev/disk/by-label/NIXOS-BOOT";
          fsType = "vfat";
        };
      };
    }
    {
      fileSystems = lib.mkMerge (
        map (
          d: {
            "${d.mountpoint}" = {
              device = "/dev/disk/by-label/${d.label}";
              fsType = d.fstype;
            };
          }
        )
        config.banana.drives
      );
    }
  ];
}
