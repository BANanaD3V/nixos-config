{...}: {
  imports = [
    ./animate.nix
  ];
  programs.nixvim.plugins.mini = {
    enable = false;
  };
}
