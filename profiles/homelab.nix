# homelab.nix
{...}: {
  # networking, firewall, and hostname
  networking = {
    hostName = "homelab";
    networkmanager.enable = true;
    firewall.enable = true;
    firewall.allowedTCPPorts = [ 445 139 ];
  };

  hardware = {
    #enableAllFirmware = true;
    bluetooth.enable = false;
    bluetooth.powerOnBoot = false;
  };

  nixpkgs.config.enableUnfree = true;

  imports = [
    ./hardware-homelab.nix
    ../modules/homelab.nix
  ];

  system.stateVersion = "23.05";
}
