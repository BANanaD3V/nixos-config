{
  config,
  pkgs,
  ...
}: {
  programs = {
    obs-studio = {
      enable = config.banana-hm.obs.enable;
      plugins = with pkgs.obs-studio-plugins; [
        obs-gstreamer
        obs-pipewire-audio-capture
        wlrobs
      ];
    };
  };
}
