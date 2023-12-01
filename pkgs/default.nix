{
  config,
  pkgs,
  ...
}: {
  users.users.banana.packages = with pkgs; [
    (pkgs.libsForQt5.callPackage ./xwaylandvideobridge {})
  ];
  environment.systemPackages = [(pkgs.libsForQt5.callPackage ./sddm-theme {})];
}
