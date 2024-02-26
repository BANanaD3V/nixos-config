{pkgs, ...}: {
  home.packages = with pkgs; [
    neofetch
  ];
  imports = [
    ./config.nix
  ];
  # Import config

  xdg.configFile."neofetch/logo" = {
    source = ./logo;
    recursive = true;
    executable = true;
  };
}
