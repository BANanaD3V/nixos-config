{
  config,
  lib,
  ...
}: {
  imports = [./plugins];
  programs.nixvim = {
    enable = true;
    globals.mapleader = " ";
    clipboard.register = "unnamedplus";
    colorschemes.base16 = {
      enable = true;
      customColorScheme =
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
