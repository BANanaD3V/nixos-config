{
  pkgs,
  lib,
  config,
  ...
}: let
  switch_workspace = import ./switch_workspace.nix {inherit lib config pkgs;};
  move_window = import ./move_window.nix {inherit lib config pkgs;};
  uploader = import ./uploader.nix {inherit pkgs;};
  grimblast = import ./grimblast.nix {inherit pkgs;};
in {
  home.packages = with pkgs; [
    move_window
    switch_workspace
    uploader
    grimblast
  ];
}
