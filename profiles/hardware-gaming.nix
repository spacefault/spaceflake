{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];
  boot.supportedFilesystems = ["btrfs" "zfs" "xfs"];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/5d0df4ee-5a17-4d00-b8fc-980747d17b46";
      fsType = "xfs";
    };

  boot.initrd.luks.devices."enc".device = "/dev/disk/by-uuid/7143ac14-2951-423c-9cec-fc2dbcda431d";

  fileSystems."/mnt/games" =
    { device = "/dev/disk/by-uuid/bad99577-2f00-4040-a6c6-167c072aa801";
      fsType = "btrfs";
      options = [ "subvol=@games" "compress=zstd" "noatime" "discard=async" "ssd" "space_cache=v2" ];
    };

  boot.initrd.luks.devices."games".device = "/dev/disk/by-uuid/ffc87718-85c1-4780-9209-f7b17828ba72";

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/8dfeec9e-87b3-426f-a2ae-7231b001d9a6";
      fsType = "btrfs";
      options = [ "subvol=@home" "compress=zstd" "noatime" "discard=async" "ssd" "space_cache=v2" ];
    };

  boot.initrd.luks.devices."home".device = "/dev/disk/by-uuid/6b9e149b-c7e3-4a76-ae2c-8ab127ab619e";

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/7276-0F9D";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };
    
  fileSystems."/export/media" = {
    device = "/mnt/media";
    options = [ "bind" ];
  };

  fileSystems."/export/store" = {
    device = "/mnt/store";
    options = [ "bind" ];
  };

  fileSystems."/export/projects" = {
    device = "/mnt/projects";
    options = [ "bind" ];
  };

  swapDevices =
    [ { device = "/dev/disk/by-partuuid/f223868c-5b6b-4f0a-b4fd-bb7802df0f75";
        randomEncryption.enable = true;}
    ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp3s0.useDHCP = lib.mkDefault false;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}

