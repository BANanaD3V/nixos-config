{ config, pkgs, inputs, ...}: {

  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  programs.neovim = {
    defaultEditor = true;
    vimAlias = true;

    extraPackages = with pkgs; [
      rust-analyzer
    ];
  };

  programs.nixvim = {
    enable = true;
    options = {
      number = true;
    };

    extraPlugins = with pkgs.vimPlugins; [
      tokyonight-nvim
      luasnip
      no-neck-pain-nvim
      nvim-nu
    ];

    plugins = {
      # Dashboard
      alpha = {
        enable = true;
        layout = [
          {
            type = "padding";
            val = 2;
          }
          {
            opts = {
              hl = "Type";
              position = "center";
            };
            type = "text";
            val = [
                "███╗   ██╗███████╗██╗  ██╗██╗   ██╗███████╗"
                "████╗  ██║██╔════╝╚██╗██╔╝██║   ██║██╔════╝"
                "██╔██╗ ██║█████╗   ╚███╔╝ ██║   ██║███████╗"
                "██║╚██╗██║██╔══╝   ██╔██╗ ██║   ██║╚════██║"
                "██║ ╚████║███████╗██╔╝ ██╗╚██████╔╝███████║"
                "╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝"
            ];
          }
          {
            type = "padding";
            val = 2;
          }
          {
            type = "group";
            val = [
              {
                command = "<CMD>ene <CR>";
                desc = "  New file";
                shortcut = "e";
              }

              {
                command = ":qa<CR>";
                desc = "󰩈  Quit Neovim";
                shortcut = "SPC q";
              }

              {
                command = ":ToggleTerm<CR>";
                desc = "  Toggle Term";
                shortcut = "SPC t";
              }
            ];
          }
          {
            type = "padding";
            val = 2;
          }
          {
            opts = {
              hl = "Keyword";
              position = "center";
            };
            type = "text";
            val = "United we stand, divided we fall.";
          }
        ];
      };
      treesitter.enable = true;
      treesitter.ensureInstalled = "all";
      presence-nvim.enable = true;
      toggleterm.enable = true;
      nvim-autopairs.enable = true;
      nix.enable = true;
      nvim-colorizer.enable = true;
      neo-tree.enable = true;
      markdown-preview.enable = true;
      auto-save.enable = true;
      lsp-format.enable = true;
      lsp = {
        enable = true;
        servers = {
          rust-analyzer.enable = true;
          pylsp.enable = true;
          nixd.enable = true;
          clangd.enable = true;
          html.enable = true;
          jsonls.enable = true;
          lua-ls.enable = true;
          zls.enable = true;
          cssls.enable = true;
          cmake.enable = true;
          bashls.enable = true;
        };
      };

      nvim-cmp.enable = true;
      lualine = {
        enable = true;
        iconsEnabled = true;
      };

      # Cmp
      cmp-nvim-lsp.enable = true;
      cmp_luasnip.enable = true;
      cmp-nvim-lua.enable = true;
      cmp-omni.enable = true;
      cmp-pandoc-nvim.enable = true;
      cmp-pandoc-references.enable = true;
      cmp-path.enable = true;
      cmp-rg.enable = true;
      cmp-snippy.enable = true;
      cmp-spell.enable = true;
      cmp-tabnine.enable = true;
      cmp-tmux.enable = true;
      cmp-treesitter.enable = true;
      cmp-vim-lsp.enable = true;
      cmp-vimwiki-tags.enable = true;
      cmp-vsnip.enable = true;
      cmp-zsh.enable = true;

      nvim-cmp.snippet.expand = "luasnip";
      nvim-cmp.mappingPresets = ["insert"];
      nvim-cmp.sources = [
	    {name = "nvim_lsp";}
	    {name = "luasnip"; }
        {name = "buffer"; }
        {name = "path"; }
      ];
      nvim-cmp.mapping = {
        "<Tab>" = "cmp.mapping.confirm({ select = true })";
      };
    };

    colorscheme = "tokyonight-night";

  };
}
