{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.banana.nvidia.drivers.enable {
    # Make sure opengl is enabled
    hardware.opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [
        vaapiVdpau
        libvdpau-va-gl
        nvidia-vaapi-driver
      ];
    };

    # Tell Xorg to use the nvidia driver (also valid for Wayland)
    services.xserver.videoDrivers = ["nvidia"];

    hardware.nvidia = {
      # Modesetting is needed for most Wayland compositors
      modesetting.enable = true;

      # Use the open source version of the kernel module
      # Only available on driver 515.43.04+
      open = false;

      package = config.boot.kernelPackages.nvidiaPackages.${config.banana.nvidia.drivers.version}; #config.boot.kernelPackages.nvidiaPackages.beta;

      # Enable the nvidia settings menu
      nvidiaSettings = true;
    };
    environment.sessionVariables = {
      NIXOS_OZONE_WL = "1";
      WLR_NO_HARDWARE_CURSORS = "1";
    };

    environment.variables = lib.mkIf config.banana.nvidia.hyprland.enable {
      GBM_BACKEND = "nvidia-drm";
      LIBVA_DRIVER_NAME = "nvidia";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      __GL_GSYNC_ALLOWED = "1";
      __GL_VRR_ALLOWED = "0";
    };
  };
}
