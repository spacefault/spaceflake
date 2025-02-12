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
      device = "/dev/disk/by-uuid/0c6811df-46b7-402a-8a54-4f2bf5aed295";
      fsType = "ext4";
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/5EFC-C50A";
      fsType = "vfat";
      options = ["fmask=0077" "dmask=0077"];
    };

    "/mnt/data" = {
      device = "/dev/disk/by-uuid/C8C41EA7C41E9830";
      fsType = "ntfs3";
      options = ["windows_names"];
    };

    "/mnt/games" = {
      device = "/dev/disk/by-uuid/C41C138F1C137C1C";
      fsType = "ntfs3";
      options = ["windows_names"];
    };
  };

  swapDevices = [
    {
      device = "/dev/disk/by-partuuid/75f9364b-04cc-4708-b795-2e0e83c8943a";
      randomEncryption.enable = true;
    }
  ];

  boot = {
    initrd.luks.devices."luks-42c4c29b-959b-442f-a862-5d646d3a1fc7".device = "/dev/disk/by-uuid/42c4c29b-959b-442f-a862-5d646d3a1fc7";
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
