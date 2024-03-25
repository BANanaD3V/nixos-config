{
  lib,
  config,
  ...
}: {
  config = lib.mkIf (config.home-manager.colorscheme
    == "biscuit") {
    colorScheme = {
      slug = "biscuit-dark";
      name = "Biscuit Dark";
      author = "Biscuit";
      palette = {
        base00 = "#1A1515";
        base01 = "#2d2424";
        base02 = "#453636";
        base03 = "#725a5a";
        base04 = "#9c8181";
        base05 = "#DCC9BC";
        base06 = "#ffe9c7";
        base0A = "#756D94";
        base08 = "#CF223E";
        base0D = "#F07342";
        base07 = "#E39C45";
        base09 = "#959A6B";
        base0B = "#768F80";
        base0C = "#614F76";
        base0E = "#7B3D79";
        base0F = "#AE3F82";
      };
    };
    home-manager.wallpaper = "rocket.png";

    xdg.configFile."vesktop/themes/nix-theme.css".text = ''
      /**
       * @name Biscuit Dark
       * @description Cozy warm colorscheme for the forest dwellers, Dark!
       * @author Tsukki
       * @source https://github.com/mwittrien/BetterDiscordAddons/tree/master/Themes/DiscordRecolor/
       * @BDEditor DiscordRecolor
      */

      @import url('https://mwittrien.github.io/BetterDiscordAddons/Themes/DiscordRecolor/DiscordRecolor.css');

      :root {
        --accentcolor: 117,109,148;
        --accentcolor2: 174,63,130;
        --linkcolor: 118,143,128;
        --mentioncolor: 227,156,69;
        --textbrightest: 255,233,199;
        --textbrighter: 255,233,199;
        --textbright: 255,233,199;
        --textdark: 220,201,188;
        --textdarker: 156,129,129;
        --textdarkest: 156,129,129;
        --font: gg sans;
        --backgroundaccent: 45,36,36;
        --backgroundprimary: 26,21,21;
        --backgroundsecondary: 45,36,36;
        --backgroundsecondaryalt: 69,54,54;
        --backgroundtertiary: 26,21,21;
        --backgroundfloating: 45,36,36;
        --settingsicons: 1;
      }

      /* Any custom CSS below here */
    '';
  };
}
