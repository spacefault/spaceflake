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

  fileSystems."/mnt/data" = {
   device = "/dev/disk/by-uuid/569DBC67112060ED";
   fsType = "ntfs3";
   options = ["windows_names"];
 };

 fileSystems."/mnt/games" = {
   device = "/dev/disk/by-uuid/38D0D91E037C5F55";
   fsType = "ntfs3";
   options = ["windows_names"];
 };

  imports = [
    ../modules/desktop.nix
    ../modules/gaming.nix
    ../modules/nvidia.nix
    ./hardware-desktop.nix
  ];

  system.stateVersion = "23.05";
}
