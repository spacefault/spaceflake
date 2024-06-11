{...}: {
  networking = {
    hostName = "daisy";
    networkmanager.enable = true;
    enableIPv6 = false;
    firewall = {
      enable = true;
      allowedTCPPorts = [
        22
        8082
        3000
        80
      ];
      allowedUDPports = [
        22
        8082
        3000
        80
      ];
    };
  };
}
