{...}: {
  programs.nixvim = {
    plugins = {
      lsp-format = {
        enable = true;
      };
      lsp = {
        enable = true;

        servers = {
          lua-ls = {
            enable = true;
            settings.telemetry.enable = false;
            extraOptions = {
              hint.enable = true;
            };
          };
          nil_ls.enable = true;
          tsserver = {
            enable = true;
            filetypes = ["javascript" "javascriptreact" "typescript" "typescriptreact"];
            extraOptions.typescript.inlayHints = {
              includeInlayEnumMemberValueHints = true;
              includeInlayFunctionLikeReturnTypeHints = true;
              includeInlayFunctionParameterTypeHints = true;
              includeInlayParameterNameHints = "all";
              includeInlayParameterNameHintsWhenArgumentMatchesName = true;
              includeInlayPropertyDeclarationTypeHints = true;
              includeInlayVariableTypeHints = true;
              includeInlayVariableTypeHintsWhenTypeMatchesName = true;
            };
          };
        };
      };
      which-key.registrations = {
        "<leader>l".name = " LSP";
      };
    };
    keymaps = [
      {
        action = "require('actions-preview').code_actions";
        lua = true;
        key = "<leader>la";
        options = {
          silent = true;
          desc = "LSP code actions";
        };
      }
    ];
  };
}
