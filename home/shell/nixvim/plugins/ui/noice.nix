{...}: {
  programs.nixvim.plugins.noice = {
    enable = true;
    notify = {
      enabled = false;
    };
    messages = {
      enabled = true;
    };
    lsp = {
      message = {
        enabled = true;
      };
      progress = {
        enabled = false;
        view = "mini";
      };
    };
    popupmenu = {
      enabled = true;
      backend = "nui";
    };
  };
}
