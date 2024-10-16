{pkgs, ...}: {
  services = {
    devmon.enable = true;
    gvfs.enable = true;
    dbus.enable = true;
    flatpak.enable = true;
    ratbagd.enable = true;
    usbmuxd.enable = true;
    fwupd.enable = true;
    fstrim.enable = true;
    gnome.gnome-keyring.enable = true;
    gnome.gnome-online-accounts.enable = true;
    printing = {
      enable = true;
      logLevel = "debug";
      drivers = [
        #pkgs.cups-kyodialog
        #pkgs.foomatic-db-ppds-withNonfreeDb
        pkgs.cnijfilter2
        #pkgs.gutenprint
      ];
    };
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
    xserver = {
      enable = true;
      excludePackages = [
        pkgs.xterm
      ];
      displayManager = {
        gdm = {
          enable = true;
        };
      };
      desktopManager = {
        gnome = {
          enable = true;
        };
      };
      xkb.layout = "";
      xkb.variant = "";
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
      wireplumber.enable = true;
    };
  };
}
