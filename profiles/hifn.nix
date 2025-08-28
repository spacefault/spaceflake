# hifn.nix
{...}: {
  # networking, firewall, and hostname
  networking = {
    hostName = "hifn";
    networkmanager.enable = true;
    firewall.enable = false;
    firewall.allowedTCPPorts = [445 139];
    firewall.allowedUDPPorts = [137 138];
  };

  hardware = {
    #enableAllFirmware = true;
    bluetooth.enable = false;
    bluetooth.powerOnBoot = false;
  };

  nixpkgs.config.enableUnfree = true;

  imports = [
    ./hardware-hifn.nix
    ../modules/desktop.nix
    ../modules/nvidia.nix
    ../modules/rice.nix
  ];

  system.stateVersion = "23.05";
}
