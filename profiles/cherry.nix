# cherry: laptop config
{
  config,
  lib,
  modulesPath,
  ...
}: {
  # networking, firewall, and hostname
  networking = {
    hostName = "cherry";
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
      device = "/dev/disk/by-uuid/8ea910cc-3dce-47f0-8eb1-6fb688657f7f";
      fsType = "ext4";
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/F03B-799F";
      fsType = "vfat";
      options = ["fmask=0077" "dmask=0077"];
    };
  };

  swapDevices = [
    {
      device = "/dev/disk/by-partuuid/0b1d0bad-50e7-46e1-a6fc-e0214cf50f65";
      randomEncryption.enable = true;
    }
  ];

  boot = {
    initrd.luks.devices."luks-4df06642-07af-4382-8b95-4985892d9adf".device = "/dev/disk/by-uuid/4df06642-07af-4382-8b95-4985892d9adf";
    initrd.availableKernelModules = ["xhci_pci" "ahci" "nvme" "usb_storage" "sd_mod"];
    kernelModules = ["kvm-intel"];
  };

  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    ../modules/desktop.nix
    ../modules/gaming.nix
  ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  system.stateVersion = "23.05";
}
