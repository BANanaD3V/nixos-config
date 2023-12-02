{
  config,
  pkgs,
  inputs,
  spicetify-nix,
  ...
}: let
  flake-compat = builtins.fetchTarball "https://github.com/edolstra/flake-compat/archive/master.tar.gz";
  spicetify-nix = (import flake-compat {src = builtins.fetchTarball "https://github.com/the-argus/spicetify-nix/archive/master.tar.gz";}).defaultNix;
  spicePkgs = spicetify-nix.packages.${pkgs.system}.default;
  officialThemes = pkgs.fetchgit {
    url = "https://github.com/spicetify/spicetify-themes";
    sha256 = "sha256-iMRutzOrZHaKfHOr2qOM/TkTYHysFBlmunVhU65kf2k=";
  };
in {
  imports = [spicetify-nix.homeManagerModule];
  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.text;
    colorScheme = "CatppuccinMocha";
    enabledExtensions = with spicePkgs.extensions; [
      autoSkipVideo
      shuffle
      playlistIcons
      genre
      seekSong
      adblock
      fullAppDisplay
    ];
    enabledCustomApps = with spicePkgs.apps; [
      lyrics-plus
    ];
  };
}
