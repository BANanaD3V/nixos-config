{...}: {
  programs.nixvim = {
    plugins.bufferline = {
      enable = true;
      diagnostics = "nvim_lsp";
    };
    keymaps = [
      {
        action = "<cmd>BufferLinePick<CR>";
        key = "<leader>bb";
        options = {
          silent = true;
          desc = "Select buffer from tabline";
        };
      }
    ];
    plugins.which-key.registrations = {
      "<leader>b".name = " Buffers";
    };
  };
}
