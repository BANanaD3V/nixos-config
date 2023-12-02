{
  config,
  pkgs,
  ...
}: {
  programs = {
    obs-studio = {
      enable = config.banana-hm.obs.enable;
      plugins = [
        pkgs.obs-studio-plugins.obs-gstreamer
        pkgs.obs-studio-plugins.obs-pipewire-audio-capture
        pkgs.obs-studio-plugins.wlrobs
      ];
    };
  };
}
