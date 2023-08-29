# desktop specific nixos options
{ config, pkgs, ... }: 

{
  imports =
    [ # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix
    ];

  # networking, firewall, and hostname
  networking = {
    hostName = "blueberry";
    networkmanager.enable = true;
    firewall.enable = true;
  };

 # swap
  swapDevices = [ {
    device = "/var/lib/swapfile";
    size = 8*1024;
  } ];

  # systemlink
  fileSystems."/mnt/systemlink" =
    { device = "/dev/disk/by-uuid/0BDA1ED800A34848";
      fsType = "ntfs-3g"; 
      options = [ "rw" "uid=1000"];
    };

  # nvidia drivers
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # you probably shouldn't change this, but if you want to please read the documentation first 
  system.stateVersion = "23.05";
}
