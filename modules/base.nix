{
  lib,
  pkgs,
  config,
  inputs,
  system,
  ...
}:

{
  # Nix
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    substituters = [
      "https://nix-gaming.cachix.org"
      "https://isabelroses.cachix.org"
    ];
    trusted-public-keys = [
      "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
      "isabelroses.cachix.org-1:mXdV/CMcPDaiTmkQ7/4+MzChpOe6Cb97njKmBQQmLPM="
    ];
  };

  # Nixpkgs
  nixpkgs = {
    config = {
      allowUnfree = true;
      packageOverrides = pkgs: {
          nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
          inherit pkgs;
        };
      };
    };

    # overlays = {
    #     (self: super: {
    #       discord = super.discord-ptb.override { withOpenASAR = true; withVencord = true; };
    #     });
    # };
  };

  # User
  users.users.banana = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = lib.mkForce false;
  boot.loader.grub = {
    enable = lib.mkForce true;
    device = "nodev";
    efiSupport = true;
    useOSProber = true;
  };

  boot.loader.efi = {
    canTouchEfiVariables = true;
    efiSysMountPoint = "/boot";
  };

  # Kernel for star citizen
  boot.kernel.sysctl = {
    "vm.max_map_count" = 16777216;
    "fs.file-max" = 524288;
  };

  # Fix USB sticks not mounting or being listed:
  services.devmon.enable = true;
  services.udisks2.enable = true;
  services.gvfs.enable = true;

  # Gtklock
  security.pam.services.gtklock = {};

  # Hardware
  hardware.opengl.enable = true;
  hardware.bluetooth.enable = true;

  # Networking
  networking = {
    networkmanager.enable = true;
    firewall.enable = false;
  };

  # XDG Desktop Portal stuff
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  # X server
  services.xserver = {
    enable = true;
    displayManager.sddm.enable = true;
    excludePackages = with pkgs; [ xterm ];
  };

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

  # Locale
  time.timeZone = "Europe/Moscow";

  # Internationalisation
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
    LC_NAME = "ru_RU.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };
  # Env packages
  environment.systemPackages = with pkgs; [
    git
    curl
    wget
    jq
    polkit
    polkit_gnome
    libsForQt5.sddm
  ];

  # Fonts
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" ]; })
    font-awesome
    material-design-icons
    meslo-lg
    meslo-lgs-nf
  ];

  # Garbage collection
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 3d";
  };

  # Enable needed programs
  programs = {
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    zsh.enable = true;
  };

  # System stateversion
  system.stateVersion = "23.05";
}



