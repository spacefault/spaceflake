{pkgs, ...}: {
  home.packages = with pkgs; [
    firefox
    google-chrome
    obsidian
    loupe
    vlc
    mpv
    git
    keepassxc
    anki-bin
    libreoffice
    thunderbird
    eza
    gnome-text-editor
    helvum
    gnucash
    pkgs.gnomeExtensions.blur-my-shell
    pkgs.gnomeExtensions.dash-to-dock
    pkgs.gnomeExtensions.caffeine
    pkgs.gnomeExtensions.appindicator
  ];
}
