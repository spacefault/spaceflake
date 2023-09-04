{ config, ... }:

{
  services = {
    devmon.enable = true;
    gvfs.enable = true;
    dbus.enable = true;
    flatpak.enable = true;
    ratbagd.enable  = true;
    gnome.gnome-keyring.enable = true;
    printing.enable = true;
    avahi = {
      enable = true;
      nssmdns = true;
      openFirewall = true;
    };
    xserver = {
      enable = false;
      layout = "us";
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
