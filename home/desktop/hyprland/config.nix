{
  lib,
  config,
  default,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = config.home-manager.hyprland.enable;
    xwayland = {
      enable = true;
      #hidpi = false;
    };
    # portalPackage = pkgs.xdg-desktop-portal-wlr;
    # portalPackage = pkgs.xdg-desktop-portal-hyprland;
    settings = with config.colorScheme.palette; {
      "$mainMod" = "SUPER";

      xwayland = {
        force_zero_scaling = true;
      };

      monitor =
        map
        (
          m: "${m.name},${m.hyprland}"
        )
        (config.home-manager.displays);

      input = {
        kb_layout = "us,ru";
        kb_options = "grp:alt_shift_toggle,ctrl:nocaps";

        follow_mouse = 1;

        touchpad = {
          natural_scroll = "no";
          disable_while_typing = false;
        };

        sensitivity = 0.3;
        accel_profile = "flat";
      };

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 3;
        "col.active_border" = "rgb(${base07}) rgb(${base0D}) 45deg";
        "col.inactive_border" = "rgb(${base02})";
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
        "col.shadow" = "rgba(${base00}ee)";
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
          "fade, 1, 7, default"
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

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        force_default_wallpaper = 0;
      };

      gestures = {
        workspace_swipe = config.home-manager.touchpad.enable;
      };

      bindl = lib.optionals config.home-manager.lid.enable [",switch:Lid Switch, exec, swaylock"];

      bindtei = [
        # Media keys

        ",XF86AudioRaiseVolume,exec,pamixer -i 2"
        ",XF86AudioLowerVolume, exec, pamixer -d 2"
        ",XF86AudioMute, exec, pamixer -t"

        # Audio keys

        ",XF86AudioPlay, exec, playerctl play-pause"
        ",XF86AudioNext, exec, playerctl next"
        ",XF86AudioPrev, exec, playerctl previous"
      ];

      bind =
        [
          # Other binds

          ",PRINT, exec, grimblast --freeze copy area"
          "$mainMod, Return, exec, kitty"
          "$mainMod, U, exec, uploader"
          "$mainMod, N, exec, swaync-client -t"
          "$mainMod, Q, killactive,"
          "$mainMod, T, togglefloating,"
          "$mainMod, D, exec, rofi -show drun -config ~/.config/rofi/configs/config.rasi"
          "$mainMod SHIFT, T, pseudo, # dwindle"
          "$mainMod, J, togglesplit,"
          "$mainMod, F, fullscreen"
          "$mainMod, V, exec, cliphist list | rofi -dmenu -config  ~/.config/rofi/configs/clipboard.rasi -p '>' | cliphist decode | wl-copy"
          "$mainMod, period, exec, rofi -modi \"emoji:rofimoji --action copy\" -show emoji -config ~/.config/rofi/configs/config.rasi"
          "$mainMod, M, exec, rofi -modi \"emoji:rofimoji --action copy --files math.csv\" -show emoji -config ~/.config/rofi/configs/config.rasi"
          "$mainMod, C, exec, hyprpicker -a"

          "$mainMod, left, movefocus, l"
          "$mainMod, right, movefocus, r"
          "$mainMod, up, movefocus, u"
          "$mainMod, down, movefocus, d"

          "$mainMod SHIFT, Space, exec, move_window special"

          # Scroll through workspaces

          "$mainMod, mouse_down, workspace, e+1"
          "$mainMod, mouse_up, workspace, e-1"

          # Move windows

          "$mainMod SHIFT, left, movewindow, l"
          "$mainMod SHIFT, right, movewindow, r"
          "$mainMod SHIFT, up, movewindow, u"
          "$mainMod SHIFT, down, movewindow, d"
        ]
        ++ (
          # Workspace binds
          builtins.concatLists (builtins.genList (
              x: let
                ws = let
                  c = (x + 1) / 10;
                in
                  builtins.toString (x + 1 - (c * 10));
              in [
                "$mainMod, ${ws}, exec, switch_workspace ${toString (x + 1)}"
                "$mainMod SHIFT, ${ws}, exec, move_window ${toString (x + 1)}"
              ]
            )
            10)
        )
        # Brightness bind
        ++ (lib.optionals config.home-manager.backlight.enable [",XF86MonBrightnessDown, exec, brightnessctl set 5%-" ",XF86MonBrightnessUp, exec, brightnessctl set +5%"]);

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
        (config.home-manager.displays);

      # Window rules

      windowrulev2 = [
        "workspace 7, class:(vesktop)"
        "workspace 6, class:(org.telegram.desktop)"
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

      exec-once =
        [
          "hyprpaper"
          "wl-paste --type text --watch cliphist store"
          "wl-paste --type image --watch cliphist store"
          "xwaylandvideobridge"
          "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &"
          "swaync"
          "ydotoold"
          "nm-applet"
          "sleep 2 && waybar"
        ]
        ++ (lib.optionals config.home-manager.bluetooth.enable ["blueman-applet"]);
      debug = {
        disable_scale_checks = true;
      };
    };
  };
}
