{...}: {
  programs.nixvim.plugins.telescope = {
    enable = true;
    keymaps = {
      "<leader>gf" = {
        action = "git_files";
        desc = "Telescope Git Files";
      };
      "<leader>fg" = "live_grep";
    };
  };
}
