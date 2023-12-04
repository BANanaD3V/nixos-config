{
  config,
  pkgs,
  lib,
  ...
}:
pkgs.writeShellScriptBin "switch_workspace" ''${lib.concatImapStringsSep "\n" (i: m: ''
      if [ "$(hyprctl activeworkspace -j | jq -r ".monitor")" = ${m.name} ]; then
          if [ $1 = "10" ]; then
              hyprctl dispatch workspace ${toString i}0
          else
              hyprctl dispatch workspace ${toString (i - 1)}$1
          fi
      fi
    '')
    config.banana-hm.displays}''
