{config, ...}: let
  hmCfg = config.home-manager.users.banana;
in {
  imports = [
    ./base.nix
    ./steam.nix
    ./nvidia.nix
    ./hardware/default.nix
  ];
}
