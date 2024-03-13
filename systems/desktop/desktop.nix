# desktop specific nixos options
{...}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # networking, firewall, and hostname
  networking = {
    hostName = "thevalley";
    networkmanager.enable = true;
    firewall.enable = true;
    enableIPv6 = false;
  };

  # systemlink
  fileSystems."/mnt/systemlink" = {
    device = "/dev/disk/by-uuid/265780BD76D648DA";
    fsType = "ntfs-3g";
    options = ["rw" "uid=1001"];
  };

  fileSystems."/mnt/games" = {
    device = "/dev/disk/by-uuid/a2062323-8617-4508-8bf8-6e2bc1d0fcd7";
    fsType = "ext4";
    options = ["defaults" "noatime"];
  };

  # env variables
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

  # you probably shouldn't change this, but if you want to please read the documentation first
  system.stateVersion = "23.05";
  system.nixos.label = "blueberry";
}
