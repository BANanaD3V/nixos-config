{lib, ...}: {
  options.home-manager = {
    colorscheme = lib.mkOption {
      type = lib.types.enum ["catppuccin" "biscuit"];
      default = "catppuccin";
    };
  };
}
