{
  pkgs,
  lib,
  inputs,
  config,
  ...
}: {
  boot = {
    bootspec.enable = true;
    lanzaboote = {
      enable = true;
      pkiBundle = "/etc/secureboot";
    };
    kernelPackages = pkgs.linuxPackages_latest;
    kernelModules = ["kvm-intel" "v4l2loopback" "vfio-pci"];
    kernelParams = ["intel_iommu=on"];
    extraModulePackages = with config.boot.kernelPackages; [v4l2loopback];
    supportedFilesystems = ["ntfs" "btrfs"];
    loader = {
      systemd-boot.enable = lib.mkForce false;
      efi.canTouchEfiVariables = true;
    };
  };
}
