{
  programs.nixvim = {
    plugins.none-ls = {
      enable = true;
      enableLspFormat = true;
      updateInInsert = false;
      sources = {
        code_actions = {
          ts_node_action.enable = true;
          gitsigns.enable = true;
          statix.enable = true;
        };
        diagnostics = {
          statix = {
            enable = true;
          };
        };
        formatting = {
          alejandra = {
            enable = true;
          };
          prettier = {
            enable = false;
            withArgs = ''
              {
                extra_args = { "--no-semi", "--single-quote" },
              }
            '';
          };
          stylua = {
            enable = true;
          };
          black = {
            enable = true;
            withArgs = ''
              {
                extra_args = { "--fast" },
              }
            '';
          };
        };
      };
    };
    keymaps = [
      {
        mode = ["n" "v"];
        key = "<leader>lf";
        action = "<cmd>lua vim.lsp.buf.format()<cr>";
        options = {
          silent = true;
          desc = "LSP format";
        };
      }
    ];
  };
}
