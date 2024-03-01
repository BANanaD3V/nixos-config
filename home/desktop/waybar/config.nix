{
  lib,
  config,
}: {
  mainBar = with config.colorScheme.palette; {
    position = "top";
    layer = "top";
    height = 60;
    spacing = 10;

    modules-left = [
      "custom/media"
      "image/album-art"
      "custom/cava"
      "group/group-audio"
    ];
    modules-center = ["hyprland/workspaces"];
    modules-right =
      (lib.optionals config.home-manager.backlight.enable ["backlight"])
      ++ (lib.optionals config.home-manager.battery.enable ["battery"])
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
        (config.home-manager.displays));

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
    "image/album-art" = {
      path = "/tmp/cover.jpeg";
      size = 32;
      interval = 5;
      on-click = "mpc toggle";
    };
    "hyprland/language" = {
      format = "<span font='16' rise='-2500' color='#${base07}'>󰌌</span> {}";
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
      format = "<span font='14' rise='-2500' color='#${base07}'>󰥔</span> {:%I:%M %p}";
      format-alt = "<span font='14' rise='-2500' color='#${base07}'></span> {:%a, %d %b %Y}";
      interval = 10;
    };

    network = {
      interface = "wlp2s0";
      format = "{ifname}";
      format-wifi = "<span font='14' rise='-2500' color='#${base07}'></span> {essid} ({signalStrength}%)";
      format-ethernet = "<span font='14' rise='-2500' color='#${base07}'>󰊗</span> {ipaddr}/{cidr}";
      format-disconnected = "";
      max-length = 50;
    };

    battery = {
      format = "<span font='10' rise='0' color='#${base07}'>{icon}</span> {capacity}%";
      format-charging = "<span font='10' rise='0' color='#${base07}'>󰂄</span> {capacity}%";
      format-critical = "<span font='10' rise='0' color='#${base01}'>󰂃</span> {capacity}%";
      interval = 15;
      states = {
        critical = 20;
      };
      format-icons = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
    };

    backlight = {
      format = "<span font='14' rise='-2500' color='#${base07}'>{icon}</span> {percent}%";
      format-icons = ["󰃞" "󰃟" "󰃝" "󰃠"];
      tooltip = false;
    };
    cpu = {
      format = "<span font='14' rise='-2500' color='#${base07}'></span> {usage}%";
      tooltip = false;
    };

    memory = {
      format = "<span font='14' rise='-2500' color='#${base07}'></span> {}%";
    };

    "group/group-audio" = {
      orientation = "inherit";
      drawer = {
        transition-duration = 500;
        children-class = "";
        transition-left-to-right = true;
      };
      tooltip = false;
      modules = [
        "pulseaudio"
        "pulseaudio/slider"
      ];
    };

    pulseaudio = {
      format = "<span font='16' rise='-2500' color='#${base07}'>{icon}</span> {volume}%";
      format-muted = "<span font='16' rise='-2500'>󰝟</span> Muted";
      format-icons = {
        default = ["" "" ""];
      };
      tooltip = false;
      on-click = "pamixer -t";
      ignored-sinks = ["Pro X Wireless Gaming Headset" "Starship/Matisse HD Audio Controller Digital Stereo (IEC958)" "PRO X Wireless Gaming Headset Analog Stereo" "PRO X Wireless Gaming Headset Digital Stereo"];
    };

    "pulseaudio/slider" = {
      min = 0;
      max = 100;
      orientation = "horizontal";
    };

    privacy = {
      icon-spacing = 10;
      icon-size = 14;
      transition-duration = 250;
      modules = [
        {
          type = "screenshare";
          tooltip = true;
          tooltip-icon-size = 14;
        }
        {
          type = "audio-out";
          tooltip = true;
          tooltip-icon-size = 14;
        }
        {
          type = "audio-in";
          tooltip = true;
          tooltip-icon-size = 14;
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
      on-click = "hyprlock";
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
      format = "<span font='16' rise='-2500' color='#${base07}'></span> {}";
      return-type = "text";
      max-length = 40;
      escape = true;
      tooltip = false;
      exec = "spotify_now_playing";
    };

    "custom/cava" = {
      format = "{}";
      return-type = "text";
      max-length = 40;
      escape = true;
      tooltip = false;
      exec = "cava_waybar";
    };
  };
}
