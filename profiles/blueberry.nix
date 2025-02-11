# laptop.nix: blueberry
{
  config,
  lib,
  modulesPath,
  ...
}: {
  # networking, firewall, and hostname
  networking = {
    hostName = "blueberry";
    networkmanager.enable = true;
    firewall.enable = true;
    useDHCP = lib.mkDefault true;
  };

  hardware = {
    enableAllFirmware = true;
    bluetooth.enable = true;
    bluetooth.powerOnBoot = true;
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/14ffd462-d5ec-4275-a9cb-67f3627af2aa";
      fsType = "ext4";
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/3A1B-FEA4";
      fsType = "vfat";
      options = ["fmask=0077" "dmask=0077"];
    };

    #    "/mnt/data" = {
    #      device = "/dev/disk/by-uuid/569DBC67112060ED";
    #      fsType = "ntfs3";
    #      options = ["windows_names"];
    #    };
    #
    #    "/mnt/games" = {
    #      device = "/dev/disk/by-uuid/38D0D91E037C5F55";
    #      fsType = "ntfs3";
    #      options = ["windows_names"];
    #    };
  };

  swapDevices = [];

  boot = {
    initrd.luks.devices."luks-941f69c6-eb39-4420-b0e6-79f88f721069".device = "/dev/disk/by-uuid/941f69c6-eb39-4420-b0e6-79f88f721069";
    initrd.availableKernelModules = ["xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod"];
    kernelModules = ["kvm-intel"];
  };

  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    ../modules/desktop.nix
    ../modules/gaming.nix
    ../modules/nvidia.nix
  ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  system.stateVersion = "23.05";
}
