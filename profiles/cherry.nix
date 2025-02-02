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
      device = "/dev/disk/by-uuid/7f942299-4650-40ee-bb36-2565b2be06ca";
      fsType = "ext4";
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/0287-067B";
      fsType = "vfat";
      options = ["fmask=0077" "dmask=0077"];
    };
  };

  swapDevices = [
    {
      device = "/dev/disk/by-partuuid/c7343511-2fcf-4fe9-a4ce-ab8a17429237";
      randomEncryption.enable = true;
    }
  ];

  boot = {
    initrd.luks.devices."luks-a89e642e-5138-4956-a8fd-14d346896c7a".device = "/dev/disk/by-uuid/a89e642e-5138-4956-a8fd-14d346896c7a";
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
