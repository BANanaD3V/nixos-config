{config, ...}: let
  hmCfg = config.home-manager.users.banana;
in {
  imports = [
    ./base.nix
    ./nix.nix
    ./steam.nix
    ./hardware
  ];
}
