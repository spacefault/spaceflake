{pkgs, ...}: {
  powerManagement = {
    cpuFreqGovernor = "performance";
  };

  sound = {
    enable = true;
  };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.sessionVariables.QT_QPA_PLATFORMTHEME = "qt5ct";
  hardware.pulseaudio.enable = false;
}
