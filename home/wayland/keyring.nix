{pkgs, ...}: {
  systemd.user.services.launchGnomeKeyring = {
    Unit.Description = "launchGnomeKeyring";

    Install = {
      WantedBy = ["default.target"];
      Wants = ["default.target"];
      After = ["default.target"];
    };

    Service = {
      Type = "simple";
      ExecStart = "${pkgs.gnome-keyring}/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };
}
