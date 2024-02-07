{ config, ... }: with config.colorScheme.palette; ''
  * {
      font-family: JetBrainsMono Nerd Font Mono;
      font-size: 13px;
      border-radius: 0px;
  }

  window#waybar {
      background-color: #${base00};
      border-radius: 0px;
      transition-property: background-color;
      transition-duration: .5s;
  }

  button {
      border: none;
  }

  button:hover {
      background: inherit;
  }

  #workspaces {
      margin-bottom: 10px;
      margin-top: 10px;
      border-radius: 5px;
      background-color: #${base01};
      padding-left: 7px;
      padding-right: 7px;
  }

  #workspaces button {
      color: #${base0B};
      padding: 5px;
  }

  #workspaces button.empty {
      color: #${base05};
  }

  #workspaces button:hover {
      background: rgba(0, 0, 0, 0.2);
  }

  #workspaces button.active {
      color: #${base0A};
  }

  #workspaces button.urgent {
      color: #${base08};
  }

  #window {
      margin: 0 4px;
  }

  .modules-left > widget:first-child > #workspaces {
      margin-left: 0;
  }

  .modules-right > widget:last-child > #workspaces {
      margin-right: 0;
  }

  #clock,
  #group-audio,
  #group-power,
  #backlight,
  #battery,
  #network,
  #memory,
  #group-audio,
  #custom-media,
  #language,
  #privacy,
  #tray,
  #cpu,
  #custom-cava {
      padding: 0 10px;
      background-color: #${base01};
      border-radius: 5px;
      color: #${base05};
      padding: 2px;
      padding-left: 10px;
      padding-right: 10px;
      margin-top: 10px;
      margin-bottom: 10px;
  }

  #network.disconnected {
      background-color: #${base08};
  }

  #battery.critical:not(.charging) {
      background-color: #${base08};
      color: #${base01};
  }

  #pulseaudio, #pulseaudio-slider {
      background-color: #${base01};
      color: #${base05};
      border-radius: 5px;
  }

  #pulseaudio-slider {
      margin-right: 10px;
      padding: 0;
      min-width: 100px;
  }

  slider {
      margin: 0;
      padding: 0;
      min-height: 0px;
      min-width: 0px;
      border-radius: 5px;
      box-shadow: none;
      background-color: #${base07};
  }

  #custom-reboot,
  #custom-lock,
  #custom-quit {
      color: #${base05};
      margin-left: 5px;
      margin-right: 5px;
      padding: 2px;
      background-color: #${base01};
  }
  #custom-reboot:hover,
  #custom-lock:hover,
  #custom-quit:hover {
      color: #${base0A};
  }

  #custom-media {
      margin: 10px;
      margin-right: 0px;
      padding: 2px;
      padding-left: 10px;
      padding-right: 10px;
  }
  #custom-power {
      color: #${base08};
      margin-left: 5px;
      margin-right: 5px;
      padding: 2px;
      background-color: #${base01};
  }

  #group-power {
      padding: 2px;
      padding-left: 10px;
      padding-right: 10px;
      margin-top: 10px;
      margin-bottom: 10px;
      margin-right: 10px;
  }

  #custom-media {
      min-width: 100px;
      margin-right: 0px;
  }
''
