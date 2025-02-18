# laptop.nix: blueberry
{...}: {
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

  imports = [
    ../modules/desktop.nix
    ../modules/gaming.nix
    ../modules/nvidia.nix
    ./hardware-desktop.nix
  ];

  system.stateVersion = "23.05";
}
