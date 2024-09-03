# laptop specific nixos options
{...}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../../modules/desktop
    ../../modules/gaming
  ];

  # networking, firewall, and hostname
  networking = {
    hostName = "cherry";
    networkmanager.enable = true;
    firewall.enable = true;
  };

  hardware.enableAllFirmware = true;
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  # env variables
  environment.sessionVariables = {
    XCURSOR_SIZE = "24";
    SSH_AUTH_SOCK = "/run/user/1001/keyring/ssh";
  };

  # you probably shouldn't change this, but if you want to please read the documentation first
  system.stateVersion = "23.05";
}
