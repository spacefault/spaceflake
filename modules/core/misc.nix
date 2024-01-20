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
    config.common.default = "*";
    extraPortals = with pkgs; [
    ];
  };

  hardware.pulseaudio.enable = false;
}
