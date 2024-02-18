{
  programs.nixvim = {
    plugins.none-ls = {
      enable = true;
      enableLspFormat = true;
      updateInInsert = false;
      sources = {
        code_actions = {
          eslint_d.enable = true;
          gitsigns.enable = true;
          statix.enable = true;
        };
        diagnostics = {
          statix = {
            enable = true;
          };
          luacheck = {
            enable = true;
          };
          flake8 = {
            enable = true;
          };
          eslint_d = {
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
          rustfmt = {
            enable = true;
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
          jq = {
            enable = true;
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
