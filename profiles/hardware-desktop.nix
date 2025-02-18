# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usbhid" "usb_storage" "uas" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];
  boot.supportedFilesystems = ["btrfs"];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/040a2faf-02a9-40f3-9d30-3abc621dcb02";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/1ADE-1341";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

  fileSystems."/home/devin/data" =
    { device = "/dev/disk/by-uuid/FEBC0114BC00C8DB";
      fsType = "ntfs3";
      options = [ "windows_names" "uid=1000" "gid=1000" "umask=0222" ];
    };

  fileSystems."/home/devin/games" =
    { device = "/dev/disk/by-uuid/5432153532151D94";
      fsType = "ntfs3";
      options = [ "windows_names" "uid=1000" "gid=1000" "umask=0222" ];
    };

  swapDevices = [ 
    {
      device = "/dev/disk/by-partuuid/c7bc6fc1-b4fb-46cb-b9e8-d10464a774ec";
      randomEncryption.enable = true;
    }
  ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp2s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
