{ config, pkgs, inputs, nixpkgs, catppuccinifier, ... }:
{
  imports = [ ./gtk.nix ./home ];
  # TODO please change the username & home direcotry to your own
  home.username = "banana";
  home.homeDirectory = "/home/banana";

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`

  ## Fonts
  # home.file.".local" = {
  #   source = ./dots/.local;
  #   recursive = true;
  # };

  ## WM

  # Wallpaper
  # home.file.".config/wallpaper" = {
  #   source = ./dots/config/wallpaper;
  #   recursive = true;
  #   executable = true;
  # };

  # Dunst
  home.file.".config/dunst" = {
    source = ./dots/config/dunst;
    recursive = true;
    executable = true;
  };

  # bspwm :(
  home.file.".config/bspwm" = {
    source = ./dots/config/bspwm;
    recursive = true;
    executable = true;
  };

  # sxhkd
  home.file.".config/sxhkd" = {
    source = ./dots/config/sxhkd;
    recursive = true;
    executable = true;
  };

  # polybar
  # home.file.".config/polybar" = {
  #   source = ./dots/config/polybar;
  #   recursive = true;
  #   executable = true;
  # };
  #
  # # picom
  # home.file.".config/picom" = {
  #   source = ./dots/config/picom;
  #   executable = true;
  #   recursive = true;
  # };

  # if i ever need xorg again, i dont.

  # Xresources
  #home.file.".Xresources" = {
  #  source = ./dots/.Xresources;
  #  executable = true;
  #};

  ## Terminal
  # Kitty config
  home.file.".config/kitty" = {
    source = ./dots/config/kitty;
    recursive = true;   # link recursively
    executable = true;  # make all files executable
  };

  # Starship config
  home.file.".config/starship.toml".source = ./dots/config/starship.toml;

  # Bashrc
  home.file.".bashrc" = {
    source = ./dots/.bashrc;
    executable = true;
  };

  # Zsh autocomplete
  # home.file.".zsh/" = {
  #   source = ./dots/.zsh;
  #   recursive = true;
  #   executable = true;
  # };

  # Neovim
  home.file.".config/nvim" = {
    source = ./dots/config/nvim;
    recursive = true;
    executable = true;
  };

  # Pipewire
  home.file.".config/pipewire" = {
    source = ./dots/config/pipewire;
    recursive = true;
    executable = true;
  };

  # Neofetch
  home.file.".config/neofetch" = {
    source = ./dots/config/neofetch;
    recursive = true;
    executable = true;
  };

  # My scripts
  home.file.".config/scripts" = {
    source = ./dots/config/scripts;
    recursive = true;
    executable = true;
  };

  # Rofi
  home.file.".config/rofi" = {
    source = ./dots/config/rofi;
    recursive = true;
    executable = true;
  };
  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  # set cursor size and dpi for 4k monitor
  xresources.properties = {
    "Xcursor.size" = 24;
    "Xft.dpi" = 120;
    "Xft.antialias" = 1;
    "Xft.hinting" = 1;
    "Xft.hintstyle" = "hintslight";
    "Xft.rgba" = "rgb";
  };

  # basic configuration of git, please change to your own
  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    ## archives
    zip
    xz
    unzip
    p7zip

    ## utils
    ripgrep # recursively searches directories for a regex pattern
    jq # A lightweight and flexible command-line JSON processor
    eza # A modern replacement for ‘ls’
    fzf # A command-line fuzzy finder
    bat
    thefuck
    feh
    wl-clipboard
    inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
    waybar
    grim
    slurp

    ## terminal
    starship
    neofetch
    zsh

    ## Nvim stuff
    lazygit
    ranger
    delta

    ## General gui apps
    discord-ptb

    ## Games
    prismlauncher

    anydesk
    zoom-us
    webcord-vencord

    unityhub
    #davinci-resolve
    kdenlive

    mediainfo
    glaxnimate

    gnome.nautilus

    xorg.xeyes
    gtklock
    cura
    blender
    # obs-studio
    # (pkgs.wrapOBS {
      # plugins = with pkgs.obs-studio-plugins; [
        # wlrobs
        # obs-pipewire-audio-capture
      # ];
    # })
    openscad
    wtwitch
    youtube-dl
    youtube-tui
    telegram-desktop
    qdirstat
    hyprpicker
    imagemagick
    catppuccinifier.packages.${pkgs.system}.cli
  ];

  #home.pointerCursor = {
  #  name = "Catppuccin-Mocha-Peach-Cursors";
  #  package = pkgs.catppuccin-cursors.mochaPeach;
  #  size = 24;
  #  gtk.enable = true;
  #  x11.enable = true;
  #};

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.05";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}


