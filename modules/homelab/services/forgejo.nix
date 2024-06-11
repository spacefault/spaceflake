{config, pkgs, ...}: {
  services.forgejo = {
    enable = true;
    useWizard = false;
    settings = {
      server.HTTP_PORT = 3001;
    };
  };
}

    
