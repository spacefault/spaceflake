{
  config,
  lib,
  pkgs,
  ...
}: {
  services.swayidle = {
    enable = true;
    events = [
        { event = "before-sleep"; command = "${pkgs.playerctl}/bin/playerctl pause"; }
        { event = "unlock"; command = "${pkgs.swww}/bin/swww kill"; }
        { event = "unlock"; command = "${pkgs.swww}/bin/swww init"; }
        { event = "lock"; command = "lock"; }
    ];
    timeouts = [
        { timeout = 90; command = "${pkgs.swaylock}/bin/swaylock -fF"; }
        { timeout = 95; command = "${pkgs.systemd}/bin/systemctl suspend"; }
    ];
  };
}
