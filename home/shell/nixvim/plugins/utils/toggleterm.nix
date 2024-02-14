{config, ...}: {
  programs.nixvim = {
    plugins.toggleterm = {
      enable = true;
      size = ''
        function(term)
          if term.direction == "horizontal" then
            return 15
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
          end
        end
      '';
      hideNumbers = true;
      shadeTerminals = false;
      startInInsert = true;
      terminalMappings = true;
      persistMode = true;
      insertMappings = false;
      closeOnExit = true;
      shell = "zsh";
      direction = "horizontal";
      autoScroll = true;
      floatOpts = {
        border = "rounded";
        winblend = 0;
      };
      winbar.enabled = false;
      highlights = {
        Normal = {
          guibg = "#${config.colorScheme.palette.base00}";
        };
        FloatBorder = {
          guifg = "#${config.colorScheme.palette.base03}";
        };
      };
    };
    plugins.which-key.registrations = {
      "<leader>t".name = " Terminal";
    };
    keymaps = [
      {
        action = "<cmd>ToggleTerm direction=float<cr>";
        key = "<leader>tt";
        options = {
          silent = true;
          desc = "Toggleterm float";
        };
      }
      {
        action = "<cmd>ToggleTerm direction=horizontal<cr>";
        key = "<leader>th";
        options = {
          silent = true;
          desc = "Togleterm horizontal split";
        };
      }
      {
        action = "<cmd>ToggleTerm direction=vertical<cr>";
        key = "<leader>tv";
        options = {
          silent = true;
          desc = "Toggleterm vertical split";
        };
      }
    ];
  };
}
