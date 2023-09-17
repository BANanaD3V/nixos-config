let
  # wallpaper = /home/banana/.config/wallpapers/spaceman.png;
  wallpaper = "/home/banana/.config/wallpapers/waterplane.png";
  # wallpaper = /home/banana/.config/wallpaper/cat_leaves.png;
in {
  xdg.configFile."hypr/hyprpaper.conf".text = ''
    preload = ${wallpaper}
    wallpaper = DP-1,${wallpaper}
    wallpaper = DP-3,${wallpaper}
  '';
}
