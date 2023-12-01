{
  config,
  pkgs,
  nix-gaming,
  ...
}: {
  programs.steam = {
    enable = true;
    package = pkgs.steam.override {
      extraProfile = "export STEAM_EXTRA_COMPAT_TOOLS_PATHS='${nix-gaming.packages.${pkgs.system}.proton-ge}'";
    };
  };
}
