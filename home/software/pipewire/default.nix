{...}: {
  imports = [
    ./config/config.nix
  ];
  xdg.configFile."pipewire/dtshx.wav" = {
    source = ./config/dtshx.wav;
  };
}
