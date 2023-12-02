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
    ./pipewire
    ./obs.nix
  ];
}
