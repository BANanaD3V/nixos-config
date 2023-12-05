{
  lib,
  inputs,
  config,
  pkgs,
  ...
}: {
  imports = [
    inputs.nix-gaming.nixosModules.steamCompat
  ];

  programs.steam = {
    enable = config.hm.banana-hm.gaming.steam.enable;
    extraCompatPackages = [
      inputs.nix-gaming.packages.${pkgs.system}.proton-ge
    ];
  };
}
