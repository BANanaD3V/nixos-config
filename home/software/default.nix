{
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    # ./firefox
    ./spotify.nix
    ./gtk.nix
    ./packages.nix
    ../../tmpimports.nix
    ./obs.nix
  ];
}
