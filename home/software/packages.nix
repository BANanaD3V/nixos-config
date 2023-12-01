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
    qbittorrent
    kdenlive
    davinci-resolve
    anydesk
    gimp
    gnome.nautilus
    gnome.gnome-disk-utility
    gnome.gnome-boxes
    kvmtool
    gtklock
    eww
    tmux
    rofi-wayland
    rofimoji
    hyprpaper
    wl-clipboard
    cliphist
    keepass
    keepassxc
    keepass-diff
    keepmenu
    wl-clip-persist
    inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
    hyprpicker
    imagemagick
    grim
    # inputs.watershot.packages.${pkgs.system}.default
    inputs.nixpkgs-wayland.packages.${system}.slurp
    flameshot
    # dunst
    libreoffice
    wpsoffice
    ydotool

    # Gui apps
    firefox
    chromium
    element-desktop
    discord-ptb
    vesktop
    webcord-vencord
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
    conda
    yt-dlp
    tinycc
    bspwm
    polybar
    sxhkd
    hollywood
    alejandra
    pciutils

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
