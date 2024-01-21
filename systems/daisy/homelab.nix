{
  config,
  pkgs,
  lib,
  ...
}: {
  services = {
    homepage-dashboard = {
      enable = true;
      openFirewall = true;
      listenPort = 8082;
    };
  };
}
