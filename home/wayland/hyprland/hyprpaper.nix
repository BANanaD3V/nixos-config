let
  wallpaper = "/home/banana/.config/wallpapers/spaceman.png";
  # wallpaper = "/home/banana/.config/wallpapers/policia.png";
  # wallpaper = "/home/banana/.config/wallpapers/motorcycle.jpeg";
in {
  xdg.configFile."hypr/hyprpaper.conf".text = ''
    preload = ${wallpaper}
    wallpaper = DP-1,${wallpaper}
    wallpaper = DP-3,${wallpaper}
  '';
}
