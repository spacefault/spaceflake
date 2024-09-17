{...}: {
  imports = [
    ./boot.nix
    ./users.nix
    ./packages.nix
    ./services.nix
    ./security.nix
    ./misc.nix
    ./nix.nix
    ./i18n.nix
    ./fonts.nix
    ./virtualisation.nix
    ./video.nix
  ];
}
