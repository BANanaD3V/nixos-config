{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      hop-nvim
    ];
    extraConfigLua = ''
            require("hop").setup {
      keys = "etovxqpdygfblzhckisuran",
      	}
    '';
    keymaps = [
      {
        action = "<cmd>HopWord<CR>";
        key = "<leader><space>";
        options = {
          silent = true;
          desc = "Hop for words";
        };
      }
    ];
  };
}
