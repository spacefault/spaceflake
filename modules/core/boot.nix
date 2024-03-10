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
    kernelModules = ["kvm-intel" "v4l2loopback"];
    extraModulePackages = with config.boot.kernelPackages; [v4l2loopback];
    supportedFilesystems = ["ntfs" "btrfs"];
    loader = {
      systemd-boot.enable = lib.mkForce true;
      efi.canTouchEfiVariables = true;
    };
  };
}
