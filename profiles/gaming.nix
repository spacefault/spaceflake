# gaming.nix
{pkgs, ...}: let

  pruneScript = pkgs.writeShellScript "sanoid-prune-if-low" ''
    #!/usr/bin/env bash
    set -euo pipefail

    # Read ZFS pool capacity (remove trailing %)
    USED=$(${pkgs.zfs}/bin/zpool list -Ho capacity tank | tr -d '%')

    if [ "$USED" -ge 85 ]; then
      echo "Pool tank is $USED full — running Sanoid prune…"
      ${pkgs.sanoid}/bin/sanoid --prune-snapshots --verbose
    fi
  '';
in
  {
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

  boot.zfs.extraPools = ["tank"];

  boot.zfs.requestEncryptionCredentials = true;
  boot.zfs.forceImportRoot = false;

  services.nfs = {
    server = {
      enable = true;
      exports = ''
        /export         10.0.0.26(rw,fsid=0,no_subtree_check,sync,root_squash)
        /export/media   10.0.0.26(rw,nohide,insecure,no_subtree_check,sync,all_squash,anonuid=1000,anongid=1000)
        /export/store   10.0.0.26(rw,nohide,insecure,no_subtree_check,sync,all_squash,anonuid=1000,anongid=1000)
        /export/projects   10.0.0.26(rw,nohide,insecure,no_subtree_check,sync,all_squash,anonuid=1000,anongid=1000)


      '';
    };
    settings = {
      nfsd.vers3 = false;
      nfsd.vers4 = true;
    };
  };

  services.sanoid = {
    enable = true;
    templates.timemachine = {
      hourly  = 24;
      daily   = 30;
      weekly  = 8;
      monthly = 0;
      autosnap  = true;
      autoprune = true;
    };
    datasets = {
      "tank" = {
        autosnap = false;
        autoprune = false;
        recursive = true;
        useTemplate = [ "timemachine" ];
      };
    };
  };
  # auto prune
  systemd.services."sanoid-auto-prune-when-low" = {
    description = "Auto-prune Sanoid snapshots when ZFS pool space is low";

    serviceConfig = {
      Type = "oneshot";
      ExecStart = pruneScript;
    };

    wantedBy = [ "multi-user.target" ];
    startAt = "hourly";
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
