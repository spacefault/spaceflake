# gaming.nix
{...}: {
  # networking, firewall, and hostname
  networking = {
    hostName = "gaming";
    hostId = "e92c1331";
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [22000 111 2049 4000 4001 4002 20048];
      allowedUDPPorts = [22000 21027 111 2049 4000 4001 4002 20048];
    };
  };

  boot.zfs.extraPools = [ "tank" ];

  boot.zfs.requestEncryptionCredentials = true;
  boot.zfs.forceImportRoot = false;

  services.nfs = {
    server = {
      enable = true;
      exports = ''
        /export         10.0.0.26(rw,fsid=0,no_subtree_check,sync,root_squash)
        /export/media   10.0.0.26(rw,nohide,insecure,no_subtree_check,sync,all_squash,anonuid=1000,anongid=1000)
        /export/documents   10.0.0.26(rw,nohide,insecure,no_subtree_check,sync,all_squash,anonuid=1000,anongid=1000)
        /export/projects   10.0.0.26(rw,nohide,insecure,no_subtree_check,sync,all_squash,anonuid=1000,anongid=1000)


      '';
    };
    settings = {
      nfsd.vers3 = false;
      nfsd.vers4 = true;
    };
  };

  hardware = {
    #enableAllFirmware = true;
    bluetooth.enable = false;
    bluetooth.powerOnBoot = false;
  };

  nixpkgs.config.enableUnfree = true;

  imports = [
    ./hardware-gaming.nix
    ../modules/desktop.nix
    ../modules/nvidia.nix
    ../modules/gaming.nix
  ];

  system.stateVersion = "23.05";
}
