{
  pkgs,
  inputs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    osu-lazer-bin
    prismlauncher
    ckan
    piper
    celeste64
    #inputs.nix-gaming.packages.${pkgs.hostPlatform.system}.osu-stable
    #inputs.nix-gaming.packages.${pkgs.hostPlatform.system}.wine-discord-ipc-bridge
    #inputs.nix-gaming.packages.${pkgs.hostPlatform.system}.wine-osu
  ];

  programs = {
    steam = {
      enable = true;
    };
    gamemode = {
      enable = true;
    };
  };
}
