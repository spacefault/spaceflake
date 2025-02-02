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
      device = "/dev/disk/by-uuid/0358a839-c849-4e6e-b261-7b64426d22a1";
      fsType = "ext4";
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/1AC2-0D3D";
      fsType = "vfat";
      options = ["fmask=0077" "dmask=0077"];
    };
  };

  swapDevices = [
    {
      device = "/dev/disk/by-partuuid/88400e35-7f50-4747-b8b1-fb693daa264b";
      randomEncryption.enable = true;
    }
  ];

  boot = {
    initrd.luks.devices."luks-d2a449c1-da9f-4eb9-89f5-41e4072631a9".device = "/dev/disk/by-uuid/d2a449c1-da9f-4eb9-89f5-41e4072631a9";
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
