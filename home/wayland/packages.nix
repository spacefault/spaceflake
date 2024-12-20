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
  ];
}
