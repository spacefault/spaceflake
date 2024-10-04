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
      enable = false;
      pkiBundle = "/etc/secureboot";
    };
    kernelPackages = pkgs.linuxPackages_latest;
    kernelModules = ["kvm-intel" "v4l2loopback" "vfio-pci"];
    kernelParams = ["intel_iommu=on"];
    extraModulePackages = with config.boot.kernelPackages; [v4l2loopback];
    extraModprobeConfig = ''
      options iwlwifi 11n_disable=8
    '';
    supportedFilesystems = ["ntfs" "btrfs"];
    loader = {
      systemd-boot.enable = lib.mkForce true;
      efi.canTouchEfiVariables = true;
    };
  };
}
