{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    firefox
    obsidian
    loupe
    vlc
    mpv
    git
    keepassxc
    anki-bin
    libreoffice-fresh
    eza
  ];
}
