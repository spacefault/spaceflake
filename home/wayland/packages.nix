{pkgs, inputs, ...}: {
  home.packages = [
    inputs.watershot.packages.${pkgs.system}.default
    inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
    pkgs.grim
    pkgs.wl-clipboard
    pkgs.gvfs
    pkgs.swaylock-effects
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
    pkgs.cliphist
    pkgs.nautilus
    pkgs.adwaita-icon-theme
    pkgs.swaynotificationcenter
  ];
}
