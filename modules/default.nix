{config, username, ...}: {
  imports = [
    ./base.nix
    ./nix.nix
    ./hyprland.nix
    ./steam.nix
    ./hardware
  ];
}
