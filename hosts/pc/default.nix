{
  lib,
  config,
  pkgs,
  ...
}: {
  fileSystems."/run/media/ssd" = {
    device = "/dev/disk/by-label/1tb_ssd";
    fsType = "btrfs";
  };

  fileSystems."/run/media/hdd" = {
    device = "/dev/disk/by-label/1tb_hdd";
    fsType = "btrfs";
  };

  networking.hostName = "banana-pc"; # Define your hostname.

  # Hyprland and nvidia
  programs.hyprland = {
    enable = true;
  };

  # services.xserver.displayManager.autoLogin = {
  #   user = "banana";
  #   enable = true;
  # };
  banana = {
    nvidia = {
      drivers.enable = true;
      hyprland.enable = true;
    };
  };
}
