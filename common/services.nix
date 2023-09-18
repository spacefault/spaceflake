{ config, pkgs, ... }:

{
  services = {
    devmon.enable = true;
    gvfs.enable = true;
    dbus.enable = true;
    flatpak.enable = true;
    ratbagd.enable  = true;
    gnome.gnome-keyring.enable = true;
    printing = {
      enable = true;
      logLevel = "debug";
      drivers = [
        pkgs.cups-kyodialog
	pkgs.foomatic-db-ppds-withNonfreeDb
      ];
    };
    avahi = {
      enable = true;
      nssmdns = true;
      openFirewall = true;
    };
    xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
      layout = "";
      xkbVariant = "";
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };
}
