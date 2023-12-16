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

  # Hyprland and nvidia
  programs.hyprland = {
    enable = true;
  };

  services.xserver.displayManager.autoLogin = {
    user = "banana";
    enable = true;
  };
  services.getty.autologinUser = "banana";

  banana = {
    nvidia = {
      drivers = {
        version = "production";
        enable = true;
      };
      hyprland.enable = true;
    };
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
