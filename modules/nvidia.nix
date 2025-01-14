{
  config,
  pkgs,
  ...
}: {
  # nvidia drivers
  services.xserver.videoDrivers = ["nvidia"];
  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "nvidia";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    WLR_NO_HARDWARE_CURSORS = "1";
    __GL_THREADED_OPTIMIZATIONS = "0";
  };
  boot.kernelParams = ["nvidia-drm.fbdev=1" "nvidia.NVreg_PreserveVideoMemoryAllocations=1"];
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        libvdpau-va-gl
        vulkan-validation-layers
        vaapiVdpau
      ];
    };
    nvidia = {
      modesetting.enable = true;
      open = true;
      nvidiaSettings = true;
      powerManagement.enable = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable; # beta is gronkling
    };
  };
}
