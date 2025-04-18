# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{
  config,
  lib,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = ["xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod"];
  boot.initrd.kernelModules = [];
  boot.kernelModules = ["kvm-intel"];
  boot.extraModulePackages = [];
  boot.supportedFilesystems = ["btrfs"];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/6a25add6-7e34-4bf6-b553-ffe3e4e5063c";
    fsType = "btrfs";
    options = ["subvol=root" "compress=zstd" "noatime" "discard=async" "ssd" "space_cache=v2"];
  };

  boot.initrd.luks.devices."enc".device = "/dev/disk/by-uuid/06381276-8518-484d-9ded-0bce3b8b5182";

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/6a25add6-7e34-4bf6-b553-ffe3e4e5063c";
    fsType = "btrfs";
    options = ["subvol=home" "compress=zstd" "noatime" "discard=async" "ssd" "space_cache=v2"];
  };

  fileSystems."/nix" = {
    device = "/dev/disk/by-uuid/6a25add6-7e34-4bf6-b553-ffe3e4e5063c";
    fsType = "btrfs";
    options = ["subvol=nix" "compress=zstd" "noatime" "discard=async" "ssd" "space_cache=v2"];
  };

  fileSystems."/var/log" = {
    device = "/dev/disk/by-uuid/6a25add6-7e34-4bf6-b553-ffe3e4e5063c";
    fsType = "btrfs";
    options = ["subvol=log" "compress=zstd" "noatime" "discard=async" "ssd" "space_cache=v2"];
    neededForBoot = true;
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/EC92-D8D9";
    fsType = "vfat";
    options = ["fmask=0022" "dmask=0022"];
  };

  swapDevices = [
    {
      device = "/dev/disk/by-partuuid/9727e4c1-a1a7-4ef6-a9fa-38d592656f47";
      randomEncryption.enable = true;
    }
  ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp6s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp0s20f0u1.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
