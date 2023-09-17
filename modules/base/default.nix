{
  lib,
  pkgs,
  config,
  inputs,
  system,
  ...
}:

{
  # Fix USB sticks not mounting or being listed:
  services.devmon.enable = true;
  services.udisks2.enable = true;
  services.gvfs.enable = true;

  # Gtklock
  security.pam.services.gtklock = {};

  # Hardware
  hardware.opengl.enable = true;
  hardware.bluetooth.enable = true;

  # Enable networking
  networking.networkmanager.enable = true;

  # XDG Desktop Portal stuff
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };

  # xdg.portal.wlr.enable = lib.mkForce false;

  # Printing support
  services.printing = {
    enable = true;
  };

  # Sound
  security.rtkit.enable = true;
  sound.enable = true;
  hardware.pulseaudio.enable = lib.mkForce false;
  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
    wireplumber.enable = true;
    jack.enable = true; # (optional)
  };

  # Locate
  services.locate = {
    enable = true;
  };

  # Enable the OpenSSH daemon
  services.openssh.enable = true;

  # Garbage collection
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 3d";
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
}



