{ ... }: {
  programs.nixvim.plugins.neo-tree = {
    enable = true;
    popupBorderStyle = "none";
  };
}