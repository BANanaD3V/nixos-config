{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      smart-splits-nvim
    ];
    extraConfigLua = ''
            require('smart-splits').setup({
      ignored_filetypes = { "nofile", "quickfix", "qf", "prompt" },
      ignored_buftypes = { "nofile" },
            })
    '';
    keymaps = [
      {
        action = "function() require('smart-splits').move_cursor_left() end";
        key = "<C-h>";
        mode = "n";
        lua = true;
      }
      {
        action = "function() require('smart-splits').move_cursor_down() end";
        key = "<C-j>";
        mode = "n";
        lua = true;
      }
      {
        action = "function() require('smart-splits').move_cursor_up() end";
        key = "<C-k>";
        mode = "n";
        lua = true;
      }
      {
        action = "function() require('smart-splits').move_cursor_right() end";
        key = "<C-l>";
        mode = "n";
        lua = true;
      }
    ];
  };
}
