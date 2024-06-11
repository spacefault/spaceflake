{config, pkgs, ...}: {
  services.forgejo = {
    enable = true;
    useWizard = true;
    settings = {
      server.HTTP_PORT = 80;
      server.DOMAIN = "localhost";
    };
  };
}

    
