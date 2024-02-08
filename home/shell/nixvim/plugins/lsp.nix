{...}: {
  programs.nixvim.plugins.lsp = {
    enable = true;

    servers = {
      tsserver.enable = true;

      lua-ls = {
        enable = true;
        settings.telemetry.enable = false;
      };
      rnix-lsp.enable = true;
    };
  };
}
