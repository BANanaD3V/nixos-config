{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = [(pkgs.libsForQt5.callPackage ./tokyo-night-sddm.nix {})];
}
