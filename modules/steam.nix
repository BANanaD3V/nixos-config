{
  inputs,
  config,
  pkgs,
  ...
}: {
  programs.steam = {
    enable = config.hm.banana-hm.gaming.steam.enabled;
    package = pkgs.steam.override {
      extraProfile = "export STEAM_EXTRA_COMPAT_TOOLS_PATHS='${inputs.nix-gaming.packages.${pkgs.system}.proton-ge}'";
    };
  };
}
