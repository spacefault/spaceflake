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

  boot.initrd.availableKernelModules = ["xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod"];
  boot.initrd.kernelModules = [];
  boot.kernelModules = ["kvm-intel"];
  boot.extraModulePackages = [];
  boot.supportedFilesystems = ["btrfs"];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/250927ee-255c-41b9-b1cf-e8847ee86a5d";
    fsType = "btrfs";
    options = ["subvol=root"];
  };

  boot.initrd.luks.devices."enc".device = "/dev/disk/by-uuid/261fae7d-c2b1-449a-970f-6335cf71e8d8";

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/250927ee-255c-41b9-b1cf-e8847ee86a5d";
    fsType = "btrfs";
    options = ["subvol=home" "compress=zstd" "noatime" "discard=async" "ssd"];
  };

  fileSystems."/nix" = {
    device = "/dev/disk/by-uuid/250927ee-255c-41b9-b1cf-e8847ee86a5d";
    fsType = "btrfs";
    options = ["subvol=nix" "compress=zstd" "noatime" "discard=async" "ssd"];
  };

  fileSystems."/var/log" = {
    device = "/dev/disk/by-uuid/250927ee-255c-41b9-b1cf-e8847ee86a5d";
    fsType = "btrfs";
    options = ["subvol=log" "compress=zstd" "noatime" "discard=async" "ssd"];
    neededForBoot = true;
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/EC00-92DF";
    fsType = "vfat";
    options = ["fmask=0022" "dmask=0022"];
  };

  swapDevices = [
    {
      device = "/dev/disk/by-partuuid/c5a78d24-3028-437f-b37a-4d385c018b06";
      randomEncryption.enable = true;
    }
  ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp3s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp2s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
