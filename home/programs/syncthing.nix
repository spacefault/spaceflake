{...}: {
  services.syncthing = {
    enable = true;
    tray.enable = true;
    overrideFolders = true;
    settings = {
      options.relaysEnabled = false;
    };
  };
}
