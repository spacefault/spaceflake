{
  config,
  pkgs,
  ...
}: {
  networking = {
    hostName = "daisy";
    networkmanager.enable = true;
    enableIPv6 = false;
    firewall = {
      enable = true;
      allowedTCPPorts = [22];
      allowedUDPports = [22];
    };
  };
}
