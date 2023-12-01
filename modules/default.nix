{config, ...}: let
  hmCfg = config.home-manager.users.banana;
in {
  imports = [
    ./base.nix
    ./steam.nix
    # ./greetd.nix
    ./nvidia.nix
    ./hardware/default.nix
  ];

  home-manager.users.banana.banana-hm.from-nixos = config.banana;
}
