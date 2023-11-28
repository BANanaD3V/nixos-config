{ lib, config, ... }:
let
  wallpaper = "/home/banana/.config/wallpapers/invasion_of_vryn.jpg";
  # wallpaper = "/home/banana/.config/wallpapers/policia.png";
  # wallpaper = "/home/banana/.config/wallpapers/motorcycle.jpeg";
in {
  xdg.configFile."hypr/hyprpaper.conf".text = ''
    preload = ${wallpaper}
    ${lib.strings.concatLines(map
        (
          m: "wallpaper = ${m.name},${wallpaper}"
        )
        (config.banana-hm.displays))}
  '';
}
