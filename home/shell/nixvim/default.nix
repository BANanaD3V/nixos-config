{ config, pkgs, ... }: {
  imports = [ ./plugins ];
programs.nixvim = {
    enable = true;
    globals.mapleader = " ";
    clipboard.register = "unnamedplus";
    colorschemes.base16 = {
      enable = true;
      colorscheme = config.colorScheme.slug;
    };
    options = {
            number = true;
      relativenumber = true;
    };
    };
}
