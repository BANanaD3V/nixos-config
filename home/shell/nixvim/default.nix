{ config, pkgs, ... }: {
programs.nixvim = {
    enable = true;

    # colorschemes.base16 = {
    #   enable = true;
    #   customColorScheme = config.colorScheme.palette;
    # };
    colorscheme = "gruvbox";
    colorschemes.gruvbox.enable  = true;
    plugins = {
    nvim-cmp = {
      enable = true;
      autoEnableSources = true;
      sources = [
        {name = "nvim_lsp";}
        {name = "path";}
        {name = "buffer";}
        {name = "luasnip";}
      ];

      mapping = {
        "<CR>" = "cmp.mapping.confirm({ select = true })";
        "<Tab>" = {
          action = ''
            function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              elseif luasnip.expandable() then
                luasnip.expand()
              elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
              elseif check_backspace() then
                fallback()
              else
                fallback()
              end
            end
          '';
          modes = [ "i" "s" ];
        };
      };
    };
    lsp = {
      enable = true;

      servers = {
        tsserver.enable = true;

        lua-ls = {
          enable = true;
          settings.telemetry.enable = false;
        };

      };
    };
    telescope.enable = true;
    oil.enable = true;
    treesitter.enable = true;
    luasnip.enable = true;
  };

    };
}
