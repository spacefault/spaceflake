{...}: {
  services.syncthing = {
    enable = true;
    overrideFolders = false;
    settings = {
      options.relaysEnabled = false;
    };
  };
}
