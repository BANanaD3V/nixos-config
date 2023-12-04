{
  config,
  pkgs,
  ...
}: {
  users.users.banana.packages = with pkgs; [
    (pkgs.callPackage ./shikimori.nix {})
  ];
  environment.systemPackages = [(pkgs.libsForQt5.callPackage ./tokyo-night-sddm.nix {})];
}
