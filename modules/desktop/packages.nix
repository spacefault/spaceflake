{
  pkgs,
  inputs,
  config,
  lib,
  ...
}: {
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    ffmpeg
    gnome.adwaita-icon-theme
    htop
    killall
    networkmanagerapplet
    cups-filters
    libimobiledevice
    ifuse
    libreoffice-fresh
    gcc
    libsForQt5.ksshaskpass
    pinentry
    gh
    gnumake
    smartmontools
  ];

  programs = {
    seahorse = {
      enable = true;
    };
    zsh = {
      enable = true;
    };
    dconf = {
      enable = true;
    };
    nix-ld = {
      enable = true;
    };
    nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 4d --keep 3";
    };
    #ssh = {
    #  startAgent = true;
    #  askPassword = pkgs.lib.mkForce "${pkgs.ksshaskpass.out}/bin/ksshaskpass";
    #};
    gnupg = {
      agent = {
        enable = true;
        #enableSSHSupport = true;
        #enableExtraSocket = true;
        #pinentryPackage = lib.mkForce pkgs.pinentry-gnome;
      };
    };
  };
}
