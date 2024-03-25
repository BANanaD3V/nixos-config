{
  pkgs,
  config,
  lib,
  ...
}: {
  imports = [
    ./plugins
    ./misc
  ];
  home.packages = with pkgs; [
    lazygit
  ];
  programs.nixvim = {
    enable = true;
    package = pkgs.neovim-nightly;
    globals.mapleader = " ";
    clipboard.register = "unnamedplus";
    colorschemes.base16 = {
      enable = true;
      colorscheme =
        lib.concatMapAttrs (name: value: {
          ${name} = "#${value}";
        })
        config.colorScheme.palette;
    };
    options = {
      number = true;
      breakindent = true;
      shiftwidth = 2;
      relativenumber = true;
      cmdheight = 0;
      fillchars.eob = " ";
      scrolloff = 1000;
      foldenable = true;
      foldlevel = 99;
      foldlevelstart = 99;
      writebackup = false;
      virtualedit = "block";
      undofile = true;
      timeoutlen = 500;
      termguicolors = true;
      smartindent = true;
    };
    highlight = with config.colorScheme.palette; {
      NeoTreeFloatBorder.fg = "#${base02}";
      WinSeparator.fg = "#${base02}";
      AlphaHeader.fg = "#${base0D}";
      AlphaFooter.fg = "#${base09}";
    };
  };
}
