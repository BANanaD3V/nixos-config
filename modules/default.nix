{config, username, ...}: let
  hmCfg = config.home-manager.users.${username};
in {
  imports = [
    ./base.nix
    ./nix.nix
    ./steam.nix
    ./hardware
  ];
}
