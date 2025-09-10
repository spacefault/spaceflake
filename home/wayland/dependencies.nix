{pkgs, ...}: {
  home.packages = with pkgs; [
    grimblast
    grim
    wl-clipboard
    gvfs
    swaylock-effects
    libnotify
    playerctl
    polkit
    slurp
    swww
    udiskie
    udisks
    wireplumber
    wlogout
    wlsunset
    xdg-user-dirs
    cliphist
    nautilus
    adwaita-icon-theme
    swaynotificationcenter
    networkmanagerapplet
    ghostty
  ];
}
