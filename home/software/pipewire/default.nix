{
  ...
}: {
  xdg.configFile."pipewire" = {
    source = ./config;
    recursive = true;
    executable = true;
  };
}
