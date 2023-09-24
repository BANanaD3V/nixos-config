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
    wl-clip-persist
    inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
    hyprpicker
    imagemagick
    grim
    slurp
    dunst

    # Gui apps
    firefox
    discord-ptb
    webcord-vencord
    telegram-desktop
    zoom-us
    qdirstat
    jellyfin-mpv-shim
    mpv

    # Development
    python3
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
    steam
    heroic-unwrapped
    gamemode
    lutris
    prismlauncher
    wine
    winetricks
    # inputs.nix-gaming.packages.${pkgs.system}.star-citizen
    inputs.nix-gaming.packages.${pkgs.system}.proton-ge

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
