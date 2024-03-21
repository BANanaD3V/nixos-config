{...}: {
  programs.nixvim.plugins = {
    telescope = {
      enable = true;
      extensions = {
        fzf-native = {
          enable = true;
        };
      };
      keymaps = {
        "<leader>ff" = {
          action = "find_files";
          desc = "Telescope Files";
        };
        "<leader>fg" = {
          action = "live_grep";
          desc = "Telescope Grep";
        };
      };
      defaults = {
        mappings = {
          i = {
            "<esc>" = {
              __raw = ''
                function(...)
                  return require("telescope.actions").close(...)
                end'';
            };
          };
        };
      };
    };
    which-key.registrations = {
      "<leader>f".name = " Find";
    };
  };
}
