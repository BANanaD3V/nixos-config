{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    # Archives
    zip
    xz
    unzip
    p7zip

    # CLI Utils
    ripgrep
    jq
    eza
    fzf
    bat
    cava
    feh
    thefuck
    unrar
    openvpn
    ffmpeg-full
    appimage-run
    maven

    # Desktop stuff
    mpd
    mpdevil

    ncmpcpp
    mpc-cli
    nom
    inkscape
    freetube
    flatpak
    calcure
    qbittorrent
    kdenlive
    # davinci-resolve
    anydesk
    krita
    gimp
    gnome.nautilus
    gnome.gnome-boxes
    kvmtool
    eww
    hyprpaper
    wl-clipboard
    cliphist
    keepass
    keepassxc
    keepass-diff
    wl-clip-persist
    hyprpicker
    imagemagick
    grim
    inputs.nixpkgs-wayland.packages.${system}.slurp
    (pkgs.flameshot.overrideAttrs {
      src = pkgs.fetchFromGitHub {
        owner = "flameshot-org";
        repo = "flameshot";
        rev = "fa29bcb4279b374ea7753fc4a514fd705499f7e7";
        sha256 = "sha256-XIquratzK4qW0Q1ZYI5X6HIrnx1kTTFxeYeR7hjrpjQ=";
      };
      cmakeFlags = [
        "-DUSE_WAYLAND_GRIM=True"
        "-DUSE_WAYLAND_CLIPBOARD=1"
      ];
      buildInputs = with pkgs; [libsForQt5.kguiaddons];
    })
    # dunst
    libreoffice
    wpsoffice
    ydotool
    lutgen

    # Gui apps
    authy
    firefox
    # firefox-devedition-bin-unwrapped
    chromium
    # element-desktop
    cinny-desktop
    telegram-desktop
    zoom-us
    qdirstat
    mpv
    libreoffice
    zathura
    todoist-electron
    obsidian

    # Development
    inputs.nix-alien.packages.${system}.nix-alien
    universal-android-debloater
    python3
    insomnia
    unityhub
    godot_4
    jetbrains.rider
    nodejs_20
    bun
    hugo
    gcc
    libstdcxx5
    zlib
    gnumake
    gh
    jdk17
    filezilla
    mongodb-compass
    docker
    docker-compose
    distrobox
    libglibutil
    glib
    glibc
    # figma-linux
    vscode
    # (pkgs.vscode.overrideAttrs (o: let
    #   version = "1.81.1";
    #   plat = "linux-x64";
    # in {
    #   src = pkgs.fetchurl {
    #     name = "VSCode_${version}_${plat}.tar.gz";
    #     url = "https://update.code.visualstudio.com/${version}/${plat}/stable";
    #     sha256 = "sha256-Tqawqu0iR0An3CZ4x3RGG0vD3x/PvQyRhVThc6SvdEg=";
    #   };
    # }))
    conda
    yt-dlp
    vlc
    youtube-dl
    tinycc
    hollywood
    alejandra
    pciutils
    cargo
    # ngrok

    # 3D modeling and printing
    # blender
    # cura
    flashprint
    openscad

    # Gaming
    steamtinkerlaunch
    yad
    r2modman
    space-station-14-launcher
    bottles
    steam
    steamcmd
    heroic
    gamemode
    lutris
    mangohud
    gamescope
    prismlauncher
    # inputs.getchoo.packages.${pkgs.system}.modrinth-app
    wine-staging
    winetricks
    # inputs.game-rs.packages.x86_64-linux.default
    inputs.nix-gaming.packages.${pkgs.system}.proton-ge
    dxvk
    chromedriver
    geckodriver
    scanmem

    # Sound
    pipewire
    # soundux
    wireplumber
    alsaLib
    pamixer
    playerctl
    wev
    pavucontrol

    # QT
    qt5.qtwayland
    qt6.qtwayland
    qt6.qmake
  ];
}
