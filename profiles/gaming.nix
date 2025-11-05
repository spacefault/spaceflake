# gaming.nix
{...}: {
  # networking, firewall, and hostname
  networking = {
    hostName = "gaming";
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [22000];
      allowedUDPPorts = [22000 21027];
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
