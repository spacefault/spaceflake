{config, pkgs, ...}: {
  services.forgejo = {
    enable = true;
    useWizard = true;
  };
}

    
