{
  config,
  ...
}: {
  programs.kitty = with config.colorScheme.palette; {
    enable = config.home-manager.kitty.enable;
    settings = {
      scrollback_lines = 10000;
      update_check_interval = 0;
      confirm_os_window_close = 0;
      background_opacity = "1";
      window_padding_width = 2;
      cursor_shape = "beam";
      cursor_beam_thickness = 9;

      foreground = "#${base05}";
      background = "#${base01}";
selection_foreground = "#${base01}";
selection_background = "#${base06}";
cursor = "#${base06}";
cursor_text_color = "#${base01}";
url_color = "#${base06}";

      color0 = "#${base03}";
      color8 = "#${base04}";

      color1 = "#${base08}";
      color9 = "#${base04}";

      color2 = "#${base0B}";
      color10 = "#${base0B}";

      color3 = "#${base0A}";
      color11 = "#${base0A}";

      color4 = "#${base0D}";
      color12 = "#${base0D}";

      color5 = "#${base06}";
      color13 = "#${base06}";

      color6 = "#${base0C}";
      color14 = "#${base0C}";
    };
   # theme = "Catppuccin-Mocha";
  };
}
