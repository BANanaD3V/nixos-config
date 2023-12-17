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
    freetube
    qbittorrent
    kdenlive
    davinci-resolve
    anydesk
    krita
    gimp
    gnome.nautilus
    gnome.gnome-disk-utility
    gnome.gnome-boxes
    kvmtool
    gtklock
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
    flameshot
    # dunst
    libreoffice
    wpsoffice
    ydotool

    # Gui apps
    firefox
    # firefox-devedition-bin-unwrapped
    chromium
    element-desktop
    vesktop
    telegram-desktop
    zoom-us
    qdirstat
    jellyfin-mpv-shim
    mpv
    libreoffice
    zathura
    todoist-electron
    obsidian

    # Development
    python3
    insomnia
    unityhub
    jetbrains.rider
    nodejs_20
    gcc
    libstdcxx5
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
    # vscode
    (pkgs.vscode.overrideAttrs (o: let
      version = "1.81.1";
      plat = "linux-x64";
    in {
      src = pkgs.fetchurl {
        name = "VSCode_${version}_${plat}.tar.gz";
        url = "https://update.code.visualstudio.com/${version}/${plat}/stable";
        sha256 = "sha256-Tqawqu0iR0An3CZ4x3RGG0vD3x/PvQyRhVThc6SvdEg=";
      };
    }))
    conda
    yt-dlp
    tinycc
    hollywood
    alejandra
    pciutils
    # ngrok

    # Dev envs
    (pkgs.buildFHSUserEnv {
      name = "cppfhs";
      runScript = "zsh";
      targetPkgs = pkgs:
        with pkgs; [
          clang_8
          gdb
          llvm_8
          valgrind
        ];
    })

    # 3D modeling and printing
    blender
    cura
    flashprint
    openscad

    # Gaming
    space-station-14-launcher
    bottles
    steam
    heroic-unwrapped
    gamemode
    lutris
    mangohud
    gamescope
    prismlauncher
    wine
    winetricks
    inputs.nix-gaming.packages.${pkgs.system}.proton-ge
    dxvk
    chromedriver
    geckodriver
    scanmem

    # Sound
    pipewire
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
