{
  config,
  pkgs,
  username,
  ...
}: {
  users.users.${username}.packages = with pkgs; [
    (pkgs.callPackage ./shikimori.nix {})
  ];
  environment.systemPackages = [(pkgs.libsForQt5.callPackage ./tokyo-night-sddm.nix {}) (pkgs.callPackage ./truckersmp-cli.nix {})];
}