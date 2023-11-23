{
  config,
  pkgs,
  ...
}: {
  # Main ssd
  fileSystems."/" = {
    device = "/dev/disk/by-label/NIXOS";
    fsType = "btrfs";
    options = ["subvol=@"];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-label/NIXOS-BOOT";
    fsType = "vfat";
  };

  # HDDs
  fileSystems."/run/media/ssd" = {
    device = "/dev/disk/by-label/1tb_ssd";
    fsType = "btrfs";
  };

  fileSystems."/run/media/hdd" = {
    device = "/dev/disk/by-label/1tb_hdd";
    fsType = "btrfs";
  };
}
