{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    # inputs.watershot.packages.${pkgs.system}.default
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
    xfce.thunar
    xfce.tumbler
    adwaita-icon-theme
    swaynotificationcenter
    networkmanagerapplet
  ];
}
