{
  inputs,
  pkgs,
  ...
}: {
  # themable spotify
  imports = [
    inputs.spicetify-nix.homeManagerModules.default
  ];
  programs.spicetify = let
    spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
  in {
    enable = true;
    theme = spicePkgs.themes.SpotifyCanvas;
    enabledExtensions = with spicePkgs.extensions; [
      adblock
    ];
  };
}
