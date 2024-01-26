{
  config,
  lib,
  pkgs,
  ...
}: let
swaylockScript = pkgs.writeShellScript "swaylockScript" ''
  ${pkgs.swaylock-effects}/bin/swaylock -fF \
	--screenshots \
	--clock \
	--indicator \
	--indicator-radius 100 \
	--indicator-thickness 7 \
	--effect-blur 7x5 \
	--effect-vignette 0.5:0.5 \
	--ring-color bb00cc \
	--key-hl-color 880033 \
	--line-color 00000000 \
	--inside-color 00000088 \
	--separator-color 00000000 \
	--grace 2 \
	--fade-in 0.2
  '';
in {
  services.swayidle = {
    enable = true;
    events = [
      {
        event = "before-sleep";
        command = "${pkgs.playerctl}/bin/playerctl pause";
      }
      {
        event = "unlock";
        command = "${pkgs.swww}/bin/swww kill";
      }
      {
        event = "unlock";
        command = "${pkgs.swww}/bin/swww init";
      }
      {
        event = "lock";
        command = "lock";
      }
    ];
    timeouts = [
      {
        timeout = 90;
        command = "${swaylockScript.outPath}";
      }
      {
        timeout = 95;
        command = "${pkgs.systemd}/bin/systemctl suspend";
      }
    ];
  };
}
