{...}: {
  programs.nixvim = {
    plugins.undotree = {
      enable = true;
      autoOpenDiff = true;
      focusOnToggle = true;
    };
    keymaps = [
      {
        mode = "n";
        key = "<leader>u";
        action = "<cmd>UndotreeToggle<CR>";
        options = {
          silent = true;
          desc = "Open undotree";
        };
      }
    ];
  };
}
