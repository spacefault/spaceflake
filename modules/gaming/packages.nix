{
  config,
  pkgs,
  input,
  nix-gaming,
  ...
}: {
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    osu-lazer-bin
    prismlauncher
    ckan
    godot_4
    unityhub
    piper
    discord
    celeste64
    #    nix-gaming.packages.${pkgs.hostPlatform.system}.osu-stable
    #    nix-gaming.packages.${pkgs.hostPlatform.system}.wine-discord-ipc-bridge
    #    nix-gaming.packages.${pkgs.hostPlatform.system}.wine-osu
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
