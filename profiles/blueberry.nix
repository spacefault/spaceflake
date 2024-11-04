# laptop.nix: blueberry
{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  # networking, firewall, and hostname
  networking = {
    hostName = "blueberry";
    networkmanager.enable = true;
    firewall.enable = true;
  };

  hardware = {
    enableAllFirmware = true;
    bluetooth.enable = true;
    bluetooth.powerOnBoot = true;
  };

  fileSystems."/home/devin/games" = {
    device = "/dev/disk/by-uuid/4e23ded3-8a11-4594-a22a-7ffe1ea347f5";
    fsType = "ext4";
    options = ["defaults" "noatime"];
  };

  environment.sessionVariables = {
    XCURSOR_SIZE = "24";
    LIBVA_DRIVER_NAME = "nvidia";
    XDG_SESSION_TYPE = "wayland";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    WLR_NO_HARDWARE_CURSORS = "1";
    __GL_THREADED_OPTIMIZATIONS = "0";
    SSH_AUTH_SOCK = "/run/user/1000/keyring/ssh";
  };


  imports = [
    ../modules/desktop.nix
    ../modules/gaming.nix
    ../modules/nvidia.nix
    ./hardware-configuration.nix
  ];

  system.stateVersion = "23.05";
}
