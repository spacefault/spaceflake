{
  pkgs,
  lib,
  inputs,
  ...
}: {
  boot = {
    bootspec.enable = true;
    lanzaboote = {
      enable = true;
      pkiBundle = "/etc/secureboot";
    };
    kernelPackages = pkgs.linuxPackages_latest;
    supportedFilesystems = ["ntfs" "btrfs"];
    loader = {
      systemd-boot.enable = lib.mkForce false;
      efi.canTouchEfiVariables = true;
    };
  };
}
