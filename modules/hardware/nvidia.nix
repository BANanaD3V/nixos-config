{
  config,
  lib,
  pkgs,
  ...
}:
let
  nvidia-offload = pkgs.writeShellScriptBin "nvidia-offload" ''
    export __NV_PRIME_RENDER_OFFLOAD=1
    export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export __VK_LAYER_NV_optimus=NVIDIA_only
    exec "$@"
  '';
in {
  config = lib.mkIf config.nixos.nvidia.drivers.enable {
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

      package = config.boot.kernelPackages.nvidiaPackages.${config.nixos.nvidia.drivers.version}; #config.boot.kernelPackages.nvidiaPackages.beta;

      # Enable the nvidia settings menu
      nvidiaSettings = true;
      prime = lib.mkIf config.hm.home-manager.battery.enable {
       offload.enable = true;

       # Bus ID of the NVIDIA GPU. You can find it using lspci, either under 3D or VGA
       nvidiaBusId = "PCI:01:0:0";

       # Bus ID of the Intel GPU. You can find it using lspci, either under 3D or VGA
       amdgpuBusId = "PCI:14:0:0";
     };
    };
    environment.sessionVariables = {
      NIXOS_OZONE_WL= "1";
      WLR_NO_HARDWARE_CURSORS = "1";
    };

    environment.variables = lib.mkIf config.nixos.nvidia.hyprland.enable {
      GBM_BACKEND = "nvidia-drm";
      LIBVA_DRIVER_NAME = "nvidia";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      __GL_GSYNC_ALLOWED = "1";
      __GL_VRR_ALLOWED = "0";
    };
    environment.systemPackages = [ nvidia-offload ];
  };
}
