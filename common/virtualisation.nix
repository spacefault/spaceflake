{
  config,
  pkgs,
  ...
}: {
  virtualisation = {
    docker = {
      enable = false;
    };
    libvirtd = {
      enable = true;
    };
  };
}
