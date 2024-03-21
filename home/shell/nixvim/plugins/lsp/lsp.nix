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
          emmet_ls = {
            enable = true;
            filetypes = [ "css" "eruby" "html" "javascript" "javascriptreact" "less" "sass" "scss" "svelte" "pug" "typescriptreact" "vue" ];
          };
          tsserver = {
          enable = true;
          };
        eslint = {enable = true;};
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
