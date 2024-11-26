# laptop.nix: cherry
{
  config,
  lib,
  ...
}: {
  # networking, firewall, and hostname
  networking = {
    hostName = "cherry";
    networkmanager.enable = true;
    firewall.enable = true;
  };

  hardware = {
    enableAllFirmware = true;
    bluetooth.enable = true;
    bluetooth.powerOnBoot = true;
  };

  imports = [
    ../modules/desktop.nix
    ../modules/gaming.nix
    ./hardware-laptop.nix
  ];

  system.stateVersion = "23.05";
}
