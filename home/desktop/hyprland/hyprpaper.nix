{
  lib,
  config,
  username,
  ...
}: let
  wallpaper = "/home/${username}/.config/wallpapers/pixel_planet.png";
in {
  xdg.configFile."hypr/hyprpaper.conf".text = ''
    preload = ${wallpaper}
    ${lib.strings.concatLines (map
      (
        m: "wallpaper = ${m.name},${wallpaper}"
      )
      (config.home-manager.displays))}
  '';
}
