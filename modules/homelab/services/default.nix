{...}: {
  imports = [
    ./homepage.nix
    #./pihole.nix
    ./forgejo.nix
  ];
  system.stateVersion = "24.05";
}
