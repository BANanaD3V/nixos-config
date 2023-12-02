{
  config,
  pkgs,
  ...
}: {
  # home.file.".config/kitty" = {
  #   source = ./dots/config/kitty;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # Starship config
  # home.file.".config/starship.toml".source = ./dots/config/starship.toml;

  # Bashrc
  # home.file.".bashrc" = {
  #   source = ./dots/.bashrc;
  #   executable = true;
  # };

  # Zsh autocomplete
  # home.file.".zsh/" = {
  #   source = ./dots/.zsh;
  #   recursive = true;
  #   executable = true;
  # };

  # neovim
  # home.file.".config/nvim" = {
  #   source = ./dots/config/nvim;
  #   recursive = true;
  #   executable = true;
  # };

  # Pipewire
  home.file.".config/pipewire" = {
    source = ./dots/config/pipewire;
    recursive = true;
    executable = true;
  };

  home.file.".config/bspwm" = {
    source = ./dots/config/bspwm;
    recursive = true;
    executable = true;
  };

  home.file.".config/sxhkd" = {
    source = ./dots/config/sxhkd;
    recursive = true;
    executable = true;
  };

  home.file.".config/polybar" = {
    source = ./dots/config/polybar;
    recursive = true;
    executable = true;
  };

  # Neofetch
  # home.file.".config/neofetch" = {
  #   source = ./dots/config/neofetch;
  #   recursive = true;
  #   executable = true;
  # };
  #
  # My scripts
  # home.file.".config/scripts" = {
  #   source = ./dots/config/scripts;
  #   recursive = true;
  #   executable = true;
  # };

  # Rofi
  # home.file.".config/rofi" = {
  #   source = ./dots/config/rofi;
  #   recursive = true;
  #   executable = true;
  # };
  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  # set cursor size and dpi for 4k monitor

}
