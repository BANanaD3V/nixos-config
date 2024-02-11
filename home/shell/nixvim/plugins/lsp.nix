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
          };
          nil_ls.enable = true;
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
