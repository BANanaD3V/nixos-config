{
  config,
  pkgs,
  inputs,
  spicetify-nix,
  ...
}: let
  spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
in {
  imports = [inputs.spicetify-nix.homeManagerModule];
  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.text;
    colorScheme = "CatppuccinMocha";
    enabledExtensions = with spicePkgs.extensions; [
      autoSkipVideo
      shuffle
      playlistIcons
      seekSong
      adblock
      fullAppDisplay
    ];
    enabledCustomApps = with spicePkgs.apps; [
      lyrics-plus
    ];
  };
}
