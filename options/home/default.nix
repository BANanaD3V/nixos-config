{lib, ...}: {
  imports = [
    ./wayland.nix
    ./hardware.nix
    ./apps.nix
  ];
}
