{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      guess-indent-nvim
    ];
    extraConfigLua = ''
          require("guess-indent").setup {
      auto_cmd = true,
      override_editorconfig = false,
      filetype_exclude = {
        "netrw",
        "tutor",
      },
      buftype_exclude = {
        "help",
        "nofile",
        "terminal",
        "prompt",
      },
      }
    '';
  };
}
