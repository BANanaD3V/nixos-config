{lib, ...}: {
  imports = [
    ./wayland.nix
  ];

  options.banana-hm = {
    from-nixos = lib.mkOption {
      type = lib.types.anything;
      description = "Options from nixos";
    };
  };
}
