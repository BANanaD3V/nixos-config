{
  inputs,
  lib,
  pkgs,
  self,
  ...
}: {
  home.packages = with pkgs; [
    neovim
    lazygit
    ranger
    delta
  ];

  # Import config
  xdg.configFile."nvim" = {
    source = inputs.nvim-config;
    recursive = true;
    executable = true;
  };
}
