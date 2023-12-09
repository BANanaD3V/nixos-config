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
  home.file.".config/nvim" = {
    source = inputs.nvim-config;
    recursive = true;
    executable = true;
  };
}
