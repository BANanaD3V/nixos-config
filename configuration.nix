# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, inputs, fetchFromGitHub, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./pkgs
    ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

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

  networking.hostName = "banana-pc"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  # Select internationalisation properties.
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

  # Configure keymap in X11
  services.xserver = {
    enable = true;
    layout = "us";
    xkbVariant = "";
    # displayManager.ly.enable = true;
    displayManager.sddm.enable = true;
    # displayManager.gdm.wayland = true;
    windowManager.bspwm.enable = true;
    excludePackages = with pkgs; [ xterm ];
    libinput = {
      enable = true;

      mouse = {
        accelProfile = "flat";
      };
    };
  };
  services.flatpak.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.banana = {
    isNormalUser = true;
    description = "banana";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      polybar
      python3
      python310Packages.pip
      python3.pkgs.pygobject3
      python3.pkgs.gst-python
      python310Packages.dbus-python
      dbus
      bspwm
      sxhkd
      cava
      picom
      feh
      neofetch
      nitch
      firefox
      kitty
      rofi-wayland
      rofimoji
      killall
      hyprpaper
      mpvpaper
      swww
      gcc
      wl-clip-persist
      cliphist
      # Dev stuff
      gh
      git

      # Sound
      pipewire
      wireplumber
      alsaLib
      pamixer
      playerctl
      wev
      pavucontrol

      # Notifications
      dunst
      #zoom-us

      openvpn
      unrar
      #spicetify-cli
      #spotify

      ffmpeg

      gnumake
      # dpkg

      jdk17
      maim

      (pkgs.buildFHSUserEnv {
        name = "cppfhs";
        runScript = "zsh";
        targetPkgs = pkgs: with pkgs; [
            clang_8 gdb llvm_8 valgrind
        ];
      })
      appimage-run
      maven
      wine
      filezilla
      # hyprland-protocols
      seatd
      jaq
      libreoffice-qt
      xorg.xprop
      gnome.gdm
      mitmproxy
      flameshot
      mpv
      oguri
    ];
  };

  # Allow unfree packages
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
    #     };)
    # };
  };
  # List packages installed in system profile. To search, run:
  # $ nix search wget


  environment.variables = {
    GBM_BACKEND = "nvidia-drm";
    LIBVA_DRIVER_NAME = "nvidia";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    __GL_GSYNC_ALLOWED = "1";
    __GL_VRR_ALLOWED = "0";
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
    # XDG_CURRENT_DESKTOP = "sway";
  };

  environment.systemPackages = with pkgs; [
    git
    curl
    jq
    neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    # hyprland
    # xwayland
    # xdg-desktop-portal
    # xdg-desktop-portal-hyprland
    qt5.qtwayland
    libsForQt5.qt5.qtwayland
    qt6.qtwayland
    qt6.qmake
    obs-studio
    obs-studio-plugins.wlrobs
    xdg-desktop-portal-hyprland
    libsForQt5.sddm
    # pulseaudio
    polkit
    polkit_gnome
    # inputs.hyprland.packages.${system}.xdg-desktop-portal-hyprland
  ];


  # enable hyprland
  programs.hyprland = {
    enable = true;
  };
  #   # portalPackage = pkgs.xdg-desktop-portal-wlr;
  #   # portalPackage = pkgs.xdg-desktop-portal-hyprland;
  #   enableNvidiaPatches = true;
  # };




  ## Fonts
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" ]; })
    font-awesome
    material-design-icons
    meslo-lg
    meslo-lgs-nf
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # services.greetd = {
  #   enable = true;
  #   settings = {
  #     default_session = {
  #       command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
  #       user = "greeter";
  #     };
  #   };
  # };

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}
