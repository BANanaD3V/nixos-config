{
  lib,
  config,
  ...
}: {
  config = lib.mkIf (config.colorscheme
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
        base0D = "#756D94";
        base08 = "#CF223E";
        base09 = "#F07342";
        base0A = "#E39C45";
        base0B = "#959A6B";
        base0C = "#768F80";
        base07 = "#614F76";
        base0E = "#7B3D79";
        base0F = "#AE3F82";
      };
    };
  };
}
