# laptop specific nixos options
{...}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # networking, firewall, and hostname
  networking = {
    hostName = "cherry";
    networkmanager.enable = true;
    firewall.enable = true;
  };

  #  boot.initrd.luks.devices = {
  #    root = {
  #      # Use https://nixos.wiki/wiki/Full_Disk_Encryption
  #      device = "/dev/disk/by-uuid/3e0d75e7-5c4b-44be-96e2-2532b00682b3";
  #      preLVM = true;
  #    };
  #  };

  boot.supportedFilesystems = ["btrfs"];
  hardware.enableAllFirmware = true;
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  # env variables
  environment.sessionVariables = {
    XCURSOR_SIZE = "24";
    SSH_AUTH_SOCK = "/run/user/1001/keyring/ssh";
  };

  # swap

  # you probably shouldn't change this, but if you want to please read the documentation first
  system.stateVersion = "23.05";
}
