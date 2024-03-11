{
  pkgs,
  username,
  ...
}: {
  users.users.${username}.packages = with pkgs; [
    (pkgs.callPackage ./shikimori.nix {})
    (pkgs.callPackage ./insomnia.nix {})
    (pkgs.callPackage ./truckersmp-cli.nix {})
  ];
  environment.systemPackages = [
    (pkgs.callPackage ./ck-client.nix {})
    (pkgs.qt6Packages.callPackage ./amnezia-vpn.nix {})
    (pkgs.libsForQt5.callPackage ./tokyo-night-sddm.nix {})
  ];
}
