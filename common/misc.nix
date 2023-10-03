{
  config,
  pkgs,
  ...
}: {
  powerManagement = {
    cpuFreqGovernor = "performance";
  };

  sound = {
    enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
    ];
  };
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  hardware.pulseaudio.enable = false;
}
