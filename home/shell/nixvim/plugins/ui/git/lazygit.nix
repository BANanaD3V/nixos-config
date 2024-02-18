{...}: {
  programs.nixvim = {
    plugins.which-key.registrations = {
      "<leader>g".name = "󰊢 Git";
    };
    keymaps = [
      {
        action = ''
          <cmd>lua _lazygit_toggle()<CR>
        '';
        key = "<leader>gg";
        options = {
          silent = true;
          noremap = true;
          desc = "Toggleterm lazygit";
        };
      }
    ];
    extraConfigLua = ''
      local Terminal  = require('toggleterm.terminal').Terminal
      local lazygit = Terminal:new({
        cmd = "lazygit",
        direction = "float",
        -- function to run on opening the terminal
        on_open = function(term)
          vim.cmd("startinsert!")
          vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
        end,
      })

      function _lazygit_toggle()
        lazygit:toggle()
      end
    '';
  };
}
