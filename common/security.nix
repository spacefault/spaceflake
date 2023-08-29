{ config, ... }:

{
  security = {
    rtkit.enable = true;
    polkit.enable = true;
    pam = {
      services.swaylock = {};
      services.gnome-keyring.gnupg.enable = true;
      services.gnome-keyring.sshAgentAuth = true;
      services.gnome-keyring.enableGnomeKeyring = true;
    };
  };
}
