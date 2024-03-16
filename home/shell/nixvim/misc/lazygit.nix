{ ... }: {
  programs.lazygit = {
    enable = true;
    settings = {
      customCommands = [
        {
          key = "c";
          command = "git cz c";
          description = "Commit with commitzen";
          context = "files";
          loadingText = "Opening commitzen...";
          subprocess = true;
        }
      ];
    };
  };
}