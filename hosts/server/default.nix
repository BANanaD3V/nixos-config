{
  lib,
  config,
  pkgs,
  ...
}: {
  # Main drive
  #
  # fileSystems."/run/media/ssd" = {
  #   device = "/dev/disk/by-label/1tb_ssd";
  #   fsType = "btrfs";
  # };
  #
  # fileSystems."/run/media/hdd" = {
  #   device = "/dev/disk/by-label/1tb_hdd";
  #   fsType = "btrfs";
  # };
  #
  networking.hostName = "banana-server"; # Define your hostname.

  banana = {
    drives = [
      {
        label = "1tb_ssd";
        mountpoint = "/run/media/ssd";
        fstype = "btrfs";
      }
      {
        label = "1tb_hdd";
        mountpoint = "/run/media/hdd";
        fstype = "btrfs";
      }
    ];
  };
}
