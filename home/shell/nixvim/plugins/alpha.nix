{ ... }: {
  programs.nixvim.plugins.alpha =
    {
      enable = true;
      theme = null;
      iconsEnabled = true;
      layout =
        let
          padding = val: {
            type = "padding";
            inherit val;
          };
        in
        [
          (padding 4)
          {
            opts = {
              hl = "AlphaHeader";
              position = "center";
            };
            type = "text";
            val = [
                 ''                __                ''
                 ''  ___   __  __ /\_\    ___ ___    ''
                 ''/' _ `\/\ \/\ \\/\ \ /' __` __`\  ''
                 ''/\ \/\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ''
                 ''\ \_\ \_\ \___/  \ \_\ \_\ \_\ \_\''
                 '' \/_/\/_/\/__/    \/_/\/_/\/_/\/_/''
            ];
          }
          (padding 2)
          {
            type = "button";
            val = "📄 New     ";
            on_press.raw = "<cmd>ene<CR>";
            opts = {
              # hl = "comment";
              keymap = [ "n" "f" ":ene <BAR> startinsert <CR>" { noremap = true; silent = true; nowait = true; } ];
              shortcut = "n";

              position = "center";
              cursor = 3;
              width = 38;
              align_shortcut = "right";
              hl_shortcut = "Keyword";
            };
          }
          (padding 1)
          {
            type = "button";
            val = "🌺 Recent  ";
            on_press.__raw = "require('telescope.builtin').oldfiles";
            opts = {
              # hl = "comment";
              keymap = [ "n" "e" ":ene <BAR> startinsert <CR>" { noremap = true; silent = true; nowait = true; } ];
              shortcut = "e";

              position = "center";
              cursor = 3;
              width = 38;
              align_shortcut = "right";
              hl_shortcut = "Keyword";
            };
          }
          (padding 1)
          {
            type = "button";
            val = "💼 Projects";
            on_press.raw = "require('telescope.builtin').live_grep";
            opts = {
              # hl = "comment";
              keymap = [ "n" "p" ":Telescope projects <CR>" { noremap = true; silent = true; nowait = true; } ];
              shortcut = "p";

              position = "center";
              cursor = 3;
              width = 38;
              align_shortcut = "right";
              hl_shortcut = "Keyword";
            };
          }
          (padding 1)
          {
            type = "button";
            val = "🔎 Restore";
            on_press.raw = "require('persistence').load()";
            opts = {
              # hl = "comment";
              keymap = [ "n" "s" ":lua require('persistence').load()<cr>" { noremap = true; silent = true; nowait = true; } ];
              shortcut = "s";

              position = "center";
              cursor = 3;
              width = 38;
              align_shortcut = "right";
              hl_shortcut = "Keyword";
            };
          }
          (padding 1)
          {
            type = "button";
            val = "❌ Projects";
            on_press.__raw = "function() vim.cmd[[qa]] end";
            opts = {
              # hl = "comment";
              keymap = [ "n" "q" ":qa<CR>" { noremap = true; silent = true; nowait = true; } ];
              shortcut = "q";

              position = "center";
              cursor = 3;
              width = 38;
              align_shortcut = "right";
              hl_shortcut = "Keyword";
            };
          }
        ];
    };
}