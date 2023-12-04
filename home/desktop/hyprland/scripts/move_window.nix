{
  config,
  pkgs,
  lib,
  ...
}:
pkgs.writeShellScriptBin "move_window" ''
    if [ $1 = "special" ]; then
        if [ "$(hyprctl activewindow -j | jq -r ".workspace.id")" = "-99" ]; then
            hyprctl dispatch movetoworkspace e+0
        else
            hyprctl dispatch movetoworkspace special
        fi
    fi
  ${(lib.concatImapStringsSep "\n" (i: m: ''
      if [ "$(hyprctl activeworkspace -j | jq -r ".monitor")" = ${m.name} ]; then
          if [ $1 = "10" ]; then
              hyprctl dispatch movetoworkspace ${toString i}0
          else
              hyprctl dispatch movetoworkspace ${toString (i - 1)}$1
          fi
      fi
    '')
    config.banana-hm.displays)}''
