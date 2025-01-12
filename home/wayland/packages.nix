{pkgs, ...}: {
  home.packages = with pkgs; [
    firefox-esr
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
  ];
}
