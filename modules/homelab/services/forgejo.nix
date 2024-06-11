{config, pkgs, ...}: {
  services.forgejo = {
    enable = true;
    useWizard = false;
    settings = {
      server.HTTP_PORT = 80;
      server.DOMAIN = "localhost";
    };
  };
}

    
