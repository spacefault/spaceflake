{
  config,
  pkgs,
  ...
}: {
  services = {
    devmon.enable = true;
    gvfs.enable = true;
    dbus.enable = true;
    flatpak.enable = true;
    ratbagd.enable = true;
    usbmuxd.enable = true;
    fwupd.enable = true;
    gnome.gnome-keyring.enable = true;
    gnome.gnome-online-accounts.enable = true;
    tailscale.enable = true;
    printing = {
      enable = true;
      logLevel = "debug";
      drivers = [
        pkgs.cups-kyodialog
        pkgs.foomatic-db-ppds-withNonfreeDb
        pkgs.cnijfilter2
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
        sddm = {
          enable = true;
        };
      };
      desktopManager = {
        plasma5 = {
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
  environment.plasma5.excludePackages = with pkgs.libsForQt5; [
    plasma-browser-integration
    konsole
  ];
}
