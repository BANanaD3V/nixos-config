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
    sha256 = "sha256-WrQ5ejqOf73TR6fbuApt6EwKsq7JkX3CDvFdbBT7UWA=";
  };
in {
  imports = [spicetify-nix.homeManagerModule];
  programs.spicetify = {
    enable = true;
    # theme = spicePkgs.themes.catppuccin-mocha;
    theme = {
      name = "text";
      src = officialThemes;
      appendName = true; # theme is located at "${src}/text" not just "${src}"

      # changes to make to config-xpui.ini for this theme:
      patches = {
        "xpui.js_find_8008" = ",(\\w+=)56,";
        "xpui.js_repl_8008" = ",\${1}32,";
      };
      injectCss = true;
      replaceColors = true;
      overwriteAssets = true;
      sidebarConfig = true;
    };

    colorScheme = "CatppuccinMocha";
    # colorScheme = "lavender";
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
