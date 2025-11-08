{pkgs, ...}: {
  home.packages = with pkgs; [
    firefox
    google-chrome
    obsidian
    loupe
    vlc
    mpv
    keepassxc
    anki-bin
    thunderbird
    eza
    gnome-text-editor
    helvum
    gnucash
    calibre
    pkgs.gnomeExtensions.blur-my-shell
    pkgs.gnomeExtensions.dash-to-dock
    pkgs.gnomeExtensions.caffeine
    pkgs.gnomeExtensions.appindicator
  ];
}
