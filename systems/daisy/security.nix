{config, ...}: {
  security = {
    rtkit.enable = true;
    polkit.enable = true;
  };
}
