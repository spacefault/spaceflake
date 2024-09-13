{pkgs, ...}: {
  home.packages = [
    pkgs.grim
    pkgs.gvfs
    pkgs.libnotify
    pkgs.playerctl
    pkgs.polkit
    pkgs.slurp
    pkgs.swww
    pkgs.udiskie
    pkgs.udisks
    pkgs.wireplumber
    pkgs.wlogout
    pkgs.wlsunset
    pkgs.xdg-user-dirs
    pkgs.swaylock-effects
    pkgs.cliphist
    pkgs.nautilus
    pkgs.adwaita-icon-theme
    pkgs.swaynotificationcenter
  ];
}
