# homelab.nix
{...}: {
  # networking, firewall, and hostname
  networking = {
    hostName = "homelab";
    networkmanager.enable = true;
    firewall.enable = true;
  };

  hardware = {
    enableAllFirmware = true;
    bluetooth.enable = false;
    bluetooth.powerOnBoot = false;
  };

  imports = [
    ./hardware-homelab.nix
  ];

  system.stateVersion = "23.05";
}
