{...}: {
  nixos = {
    nvidia = {
      drivers.enable = true;
      hyprland.enable = false;
    };
  };
}
