{
  config,
  pkgs,
  lib,
  ...
}: {
  hardware = {
    opengl = {
      enable = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [
        vaapiVdpau
        libvdpau-va-gl
        vulkan-validation-layers
      ];
    };
  };
}
