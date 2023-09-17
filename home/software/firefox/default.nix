{ config, default, ... }:
let
  inherit (default) colors;
  userchrome = import ./userchrome.nix;
  usercontent = import ./usercontent.nix;
in {
  programs.firefox = {
    enable = true;
    profiles = {
      banana = {
        userChrome = userchrome;
        userContent = usercontent;
      };
    };
  };
}
