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

 # fileSystems."/home/devin/games" = {
 #   device = "/dev/disk/by-uuid/4e23ded3-8a11-4594-a22a-7ffe1ea347f5";
 #   fsType = "ext4";
 #   options = ["defaults" "noatime"];
 # };

  imports = [
    ../modules/desktop.nix
    ../modules/gaming.nix
    ../modules/nvidia.nix
    ./hardware-desktop.nix
  ];

  system.stateVersion = "23.05";
}
