# laptop specific nixos options
{ config, pkgs, ... }: 

{
  imports =
    [ # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix
    ];

  # networking, firewall, and hostname
  networking = {
    hostName = "cherry";
    networkmanager.enable = true;
    firewall.enable = true;
  };

 # swap
  swapDevices = [ {
    device = "/var/lib/swapfile";
    size = 12*1024;
  } ];

  # you probably shouldn't change this, but if you want to please read the documentation first 
  system.stateVersion = "23.05";
}
