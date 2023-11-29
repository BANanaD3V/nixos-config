{
  lib,
  config,
}: let
  nixosCfg = config.banana-hm.from-nixos;
in {
  mainBar = {
    position = "top";
    layer = "top";
    height = 60;
    spacing = 10;

    modules-left = [
      "custom/media"
      "custom/cava"
      "group/group-audio"
    ];
    modules-center = ["hyprland/workspaces"];
    modules-right =
      (lib.optionals nixosCfg.backlight.enable ["backlight"])
      ++ (lib.optionals nixosCfg.battery.enable ["battery"])
      ++ [
        "cpu"
        "memory"
        "hyprland/language"
        "clock"
        "privacy"
        "tray"
        "group/group-power"
      ];

    "hyprland/workspaces" = {
      format = "{icon}";
      # format = "<span font='13'>{icon}</span>";
      format-icons = {
        empty = "<span font='11' rise='-3000'>󰑊</span>";
        active = "<span font='13' rise='-3000'>󰮯</span>";
        default = "<span font='13' rise='-3000'>󰊠</span>";
      };
      persistent-workspaces = builtins.listToAttrs (map (m: {
          name = m.name;
          value = m.workspaces;
        })
        (config.banana-hm.displays));

      on-click = "activate";
      on-scroll-up = "hyprctl dispatch workspace e+1";
      on-scroll-down = "hyprctl dispatch workspace e-1";
      sort-by-number = true;
    };

    keyboard-state = {
      format = "{name} <span font='12'>{icon}</span>";
      format-icons = {
        locked = "";
        unlocked = "";
      };
    };

    "hyprland/language" = {
      format = "<span font='16' rise='-2500' color='#b4befe'>󰌌</span> {}";
      format-en = "US";
      format-ru = "RU";
      keyboard-name = "logitech-usb-receiver-keyboard";
      on-click = "hyprctl switchxkblayout logitech-usb-receiver-keyboard next";
    };

    tray = {
      spacing = 10;
      reverse-direction = true;
    };

    clock = {
      timezone = "Europe/Moscow";
      format = "<span font='14' rise='-2500' color='#b4befe'>󰥔</span> {:%I:%M %p}";
      format-alt = "<span font='14' rise='-2500' color='#b4befe'></span> {:%a, %d %b %Y}";
      interval = 10;
    };

    network = {
      interface = "wlp2s0";
      format = "{ifname}";
      format-wifi = "<span font='14' rise='-2500' color='#b4befe'></span> {essid} ({signalStrength}%)";
      format-ethernet = "<span font='14' rise='-2500' color='#b4befe'>󰊗</span> {ipaddr}/{cidr}";
      format-disconnected = "";
      max-length = 50;
    };

    battery = {
      format = "<span font='10' rise='0' color='#b4befe'>{icon}</span> {capacity}%";
      format-charging = "<span font='10' rise='0' color='#b4befe'>󰂄</span> {capacity}%";
      format-critical = "<span font='10' rise='0' color='#11111b'>󰂃</span> {capacity}%";
      interval = 15;
      states = {
        critical = 20;
      };
      format-icons = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
    };

    backlight = {
      format = "{percent}% {icon}";
      format-icons = ["" ""];
    };
    cpu = {
      format = "<span font='14' rise='-2500' color='#b4befe'></span> {usage}%";
      tooltip = false;
    };

    memory = {
      format = "<span font='14' rise='-2500' color='#b4befe'></span> {}%";
    };

    "group/group-audio" = {
      orientation = "inherit";
      drawer = {
        transition-duration = 500;
        children-class = "";
        transition-left-to-right = true;
      };
      modules = [
        "pulseaudio"
        "pulseaudio/slider"
      ];
    };

    pulseaudio = {
      format = "<span font='16' rise='-2500' color='#b4befe'>{icon}</span> {volume}%";
      format-muted = "<span font='16' rise='-2500'>󰝟</span> Muted";
      format-icons = {
        default = ["" "" ""];
      };
      on-click = "pamixer -t";
      ignored-sinks = ["Pro X Wireless Gaming Headset" "Starship/Matisse HD Audio Controller Digital Stereo (IEC958)" "PRO X Wireless Gaming Headset Analog Stereo"];
    };

    "pulseaudio/slider" = {
      min = 0;
      max = 100;
      orientation = "horizontal";
    };

    privacy = {
      icon-spacing = 4;
      icon-size = 18;
      transition-duration = 250;
      modules = [
        {
          type = "screenshare";
          tooltip = true;
          tooltip-icon-size = 24;
        }
        {
          type = "audio-out";
          tooltip = true;
          tooltip-icon-size = 24;
        }
        {
          type = "audio-in";
          tooltip = true;
          tooltip-icon-size = 24;
        }
      ];
    };

    "group/group-power" = {
      orientation = "inherit";
      drawer = {
        transition-duration = 500;
        children-class = "child-power";
        transition-left-to-right = false;
      };
      modules = [
        "custom/power"
        "custom/quit"
        "custom/lock"
        "custom/reboot"
      ];
    };

    "custom/quit" = {
      format = "<span font='14' rise='-3000'>󰗼</span>";
      tooltip = false;
      on-click = "hyprctl dispatch exit";
    };

    "custom/lock" = {
      format = "<span font='14' rise='-3000'>󰍁</span>";
      tooltip = false;
      on-click = "gtklock";
    };

    "custom/power" = {
      format = "<span font='14' rise='-3000'></span>";
      tooltip = false;
      on-click = "shutdown now";
    };

    "custom/reboot" = {
      format = "<span font='14' rise='-3000'>󰜉</span>";
      tooltip = false;
      on-click = "reboot";
    };

    "custom/media" = {
      format = "<span font='16' rise='-2500' color='#b4befe'></span> {}";
      return-type = "text";
      max-length = 40;
      escape = true;
      exec = "$HOME/.config/waybar/scripts/spotify-now-playing.sh";
    };

    "custom/cava" = {
      format = "{}";
      return-type = "text";
      max-length = 40;
      escape = true;
      exec = "$HOME/.config/waybar/scripts/cava.sh";
    };
  };
}
