{
  inputs,
  pkgs,
  config,
  default,
  username,
  ...
}: let
  inherit (default) colors;
  userchrome = import ./userchrome.nix;
  usercontent = import ./usercontent.nix;
in {
  programs.firefox = {
    enable = true;
    profiles.${username} = {
      userChrome = userchrome;
      userContent = usercontent;
      extensions = with inputs.firefox-addons.packages.${pkgs.system}; [
        ublock-origin
        darkreader
        sponsorblock
        stylus
        firefox-color
        localcdn
        censor-tracker
        return-youtube-dislikes
        user-agent-string-switcher
        new-tab-override
      ];
    };
  };
}
