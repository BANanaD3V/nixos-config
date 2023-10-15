{ pkgs, inputs, ... }:

{
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
    starship
    neofetch
    inputs.catppuccinifier.packages.${pkgs.system}.cli
    unrar
    openvpn
    ffmpeg
    appimage-run
    maven

    # Desktop stuff
    gnome.nautilus
    gnome.gnome-boxes
    kvmtool
    gtklock
    kitty
    rofi-wayland
    rofimoji
    hyprpaper
    waybar
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
    slurp
    dunst
    libreoffice
    ydotool

    # Gui apps
    firefox
    discord-ptb
    webcord-vencord
    telegram-desktop
    zoom-us
    qdirstat
    jellyfin-mpv-shim
    mpv
    libreoffice
    zathura

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
    figma-linux
    vscode
    conda
    youtube-dl
    tinycc
     	nur.repos.ataraxiasjel.ceserver
     	nur.repos.ataraxiasjel.protonhax
    # Dev envs
    (pkgs.buildFHSUserEnv {
      name = "cppfhs";
      runScript = "zsh";
      targetPkgs = pkgs: with pkgs; [
        clang_8 gdb llvm_8 valgrind
      ];
    })

    # 3D modeling
    blender
    cura
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
    # wineWowPackages.stable
    winetricks
    # inputs.nix-gaming.packages.${pkgs.system}.star-citizen
    # inputs.nix-gaming.packages.${pkgs.system}.proton-ge
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
