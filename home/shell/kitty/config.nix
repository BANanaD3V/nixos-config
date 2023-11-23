{
  config,
  default,
  pkgs,
  ...
}: {
  programs.kitty = {
    enable = true;
    settings = {
      scrollback_lines = 10000;
      update_check_interval = 0;
      confirm_os_window_close = 0;
      background_opacity = "0.7";
      cursor_shape = "beam";
      cursor_beam_thickness = 9;
    };
    theme = "Catppuccin-Mocha";
  };
}
