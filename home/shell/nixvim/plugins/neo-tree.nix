{...}: {
  programs.nixvim = {
    plugins.neo-tree = {
      enable = true;
      popupBorderStyle = "rounded";
      filesystem.hijackNetrwBehavior = "open_default";
    };
    keymaps = [
      {
        action = "<cmd>Neotree toggle<CR>";
        key = "<leader>e";
        mode = "n";
        options = {
          silent = true;
          desc = "Toggle neotree";
        };
      }
      {
        action = ''
            function()
            if vim.bo.filetype == "neo-tree" then
              vim.cmd.wincmd "p"
            else
              vim.cmd.Neotree "focus"
            end
          end
        '';
        lua = true;
        key = "<leader>o";
        mode = "n";
        options = {
          desc = "Focus neotree";
          silent = true;
        };
      }
    ];
  };
}
