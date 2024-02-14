{
  programs.nixvim.plugins.conform-nvim = {
    enable = true;
    formatOnSave = {
      lspFallback = true;
      timeoutMs = 500;
    };
    notifyOnError = true;
    formattersByFt = {
      html = [["prettierd" "prettier"]];
      css = [["prettierd" "prettier"]];
      javascript = [["prettierd" "prettier"]];
      javascriptreact = [["prettierd" "prettier"]];
      typescript = [["prettierd" "prettier"]];
      typescriptreact = [["prettierd" "prettier"]];
      java = ["google-java-format"];
      python = ["black"];
      lua = ["stylua"];
      nix = ["alejandra"];
      markdown = [["prettierd" "prettier"]];
      rust = ["rustfmt"];
    };
  };
}
