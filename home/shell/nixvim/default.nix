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
    colorschemes = {
    catppuccin = {
      enable = true;
      background = {
        light = "macchiato";
        dark = "mocha";
      };
      flavour = "mocha"; # "latte", "mocha", "frappe", "macchiato" or raw lua code
      disableBold = false;
      disableItalic = false;
      disableUnderline = false;
      transparentBackground = true;
      integrations = {
        cmp = true;
        noice = true;
        notify = true;
        neotree = true;
        harpoon = true;
        gitsigns = true;
        which_key = true;
        illuminate = {
          enabled = true;
        };
        treesitter = true;
        treesitter_context = true;
        telescope.enabled = true;
        indent_blankline.enabled = true;
        mini.enabled = true;
        native_lsp = {
          enabled = true;
          inlay_hints = {
            background = true;
          };
          underlines = {
            errors = ["underline"];
            hints = ["underline"];
            information = ["underline"];
            warnings = ["underline"];
          };
        };
      };
    };
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
