{
  lib,
  config,
  default,
  ...
}: let
  inherit (default) colors;
in {
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
      #hidpi = false;
    };
    # portalPackage = pkgs.xdg-desktop-portal-wlr;
    # portalPackage = pkgs.xdg-desktop-portal-hyprland;
    enableNvidiaPatches = true;
    settings = {
      "$mainMod" = "SUPER";

      xwayland = {
        force_zero_scaling = true;
      };

      monitor =
        map
        (
          m: "${m.name},${m.hyprland}"
        )
        (config.banana-hm.displays);

      input = {
        kb_layout = "us,ru";
        kb_options = "grp:alt_shift_toggle";

        follow_mouse = 1;

        touchpad = {
          natural_scroll = "no";
        };

        sensitivity = 0.3;
        accel_profile = "flat";
      };

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 3;
        "col.active_border" = "rgb(b4befe) rgb(89b4fa) 45deg";
        "col.inactive_border" = "rgb(313244)";
        layout = "dwindle";
      };

      decoration = {
        rounding = 10;
        blur = {
          size = 5;
          passes = 3;
          new_optimizations = "on";
          xray = false;
        };
        drop_shadow = "yes";
        shadow_range = 4;
        shadow_render_power = 3;
        dim_special = 0;
        # multisample_edges = true;
        "col.shadow" = "rgba(1a1a1aee)";
      };

      animations = {
        bezier = [
          "windowBezier, 0.05, 0.9, 0.1, 1.05"
        ];
        animation = [
          "windows, 1, 7, windowBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "workspaces, 1, 6, default"
        ];
      };

      dwindle = {
        pseudotile = "yes";
        preserve_split = "yes";
        force_split = 2;
      };

      master = {
        new_is_master = true;
      };

      gestures = {
        workspace_swipe = "on";
      };

      misc = {
        disable_hyprland_logo = true;
        force_hypr_chan = false;
      };

      bind = [
        # Media keys

        ",XF86AudioRaiseVolume,exec,pamixer -i 2"
        ",XF86AudioLowerVolume, exec, pamixer -d 2"
        ",XF86AudioMute, exec, pamixer -t"

        # Audio keys

        ",XF86AudioPlay, exec, playerctl play-pause"
        ",XF86AudioNext, exec, playerctl next"
        ",XF86AudioPrev, exec, playerctl previous"

        # Other binds

        ",PRINT, exec, grimblast --freeze copy area"
        "$mainMod, Return, exec, kitty"
        "$mainMod, U, exec, ~/.config/hypr/scripts/uploader.sh"
        "$mainMod, N, exec, swaync-client -t"
        "$mainMod, Q, killactive,"
        "$mainMod, T, togglefloating,"
        "$mainMod, D, exec, rofi -show drun -config ~/.config/rofi/configs/config.rasi"
        "$mainMod SHIFT, T, pseudo, # dwindle"
        "$mainMod, J, togglesplit,"
        "$mainMod, F, fullscreen"
        "$mainMod, V, exec, cliphist list | rofi -dmenu -config  ~/.config/rofi/configs/clipboard.rasi -p '>' | cliphist decode | wl-copy"
        # "$mainMod, V, exec, rofi -modi clipboard:~/.config/scripts/cliphist-rofi.sh -show clipboard -config ~/.config/rofi/configs/clipboard.rasi"
        "$mainMod, period, exec, rofi -modi \"emoji:rofimoji\" -show emoji -config ~/.config/rofi/configs/config.rasi"
        "$mainMod, C, exec, hyprpicker -a"

        # Workspace binds

        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        # Switch workspaces

        "$mainMod, 1, exec, ~/.config/hypr/scripts/switch_workspace.sh 1"
        "$mainMod, 2, exec, ~/.config/hypr/scripts/switch_workspace.sh 2"
        "$mainMod, 3, exec, ~/.config/hypr/scripts/switch_workspace.sh 3"
        "$mainMod, 4, exec, ~/.config/hypr/scripts/switch_workspace.sh 4"
        "$mainMod, 5, exec, ~/.config/hypr/scripts/switch_workspace.sh 5"
        "$mainMod, 6, exec, ~/.config/hypr/scripts/switch_workspace.sh 6"
        "$mainMod, 7, exec, ~/.config/hypr/scripts/switch_workspace.sh 7"
        "$mainMod, 8, exec, ~/.config/hypr/scripts/switch_workspace.sh 8"
        "$mainMod, 9, exec, ~/.config/hypr/scripts/switch_workspace.sh 9"
        "$mainMod, 0, exec, ~/.config/hypr/scripts/switch_workspace.sh 10"

        # Move to workspace

        "$mainMod SHIFT, 1, exec, ~/.config/hypr/scripts/move_window.sh 1"
        "$mainMod SHIFT, 2, exec, ~/.config/hypr/scripts/move_window.sh 2"
        "$mainMod SHIFT, 3, exec, ~/.config/hypr/scripts/move_window.sh 3"
        "$mainMod SHIFT, 4, exec, ~/.config/hypr/scripts/move_window.sh 4"
        "$mainMod SHIFT, 5, exec, ~/.config/hypr/scripts/move_window.sh 5"
        "$mainMod SHIFT, 6, exec, ~/.config/hypr/scripts/move_window.sh 6"
        "$mainMod SHIFT, 7, exec, ~/.config/hypr/scripts/move_window.sh 7"
        "$mainMod SHIFT, 8, exec, ~/.config/hypr/scripts/move_window.sh 8"
        "$mainMod SHIFT, 9, exec, ~/.config/hypr/scripts/move_window.sh 9"
        "$mainMod SHIFT, 0, exec, ~/.config/hypr/scripts/move_window.sh 10"

        "$mainMod SHIFT, Space, exec, ~/.config/hypr/scripts/move_window.sh special"
        # Scroll through workspaces

        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"

        # Move windows

        "$mainMod SHIFT, left, movewindow, l"
        "$mainMod SHIFT, right, movewindow, r"
        "$mainMod SHIFT, up, movewindow, u"
        "$mainMod SHIFT, down, movewindow, d"
      ];
      bindm = [
        # Move / Resize windows

        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      # Per-monitor workspaces

      workspace =
        lib.lists.concatMap
        (
          m: map (w: "${toString w},monitor:${m.name}") (m.workspaces)
        )
        (config.banana-hm.displays);

      # Window rules

      windowrulev2 = [
        "workspace 7, class:(discord)"
        "workspace 2, class:(firefox)"
        "workspace 4, title:Spotify"

        # Xwaylandvideobridge

        "opacity 0.0 override 0.0 override,class:^(xwaylandvideobridge)$"
        "noanim,class:^(xwaylandvideobridge)$"
        "nofocus,class:^(xwaylandvideobridge)$"
        "noinitialfocus,class:^(xwaylandvideobridge)$"
      ];

      # Layer rules

      layerrule = [
        "blur, waybar"
        "blur, kitty"
      ];

      # Autostart

      exec-once = [
        "~/.config/hypr/scripts/start.sh"
      ];
    };
  };
}
