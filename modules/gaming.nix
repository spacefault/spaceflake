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
    lutris
    #inputs.nix-gaming.packages.${pkgs.hostPlatform.system}.osu-stable
    #inputs.nix-gaming.packages.${pkgs.hostPlatform.system}.wine-discord-ipc-bridge
    #inputs.nix-gaming.packages.${pkgs.hostPlatform.system}.wine-osu
  ];

  systemd.extraConfig = ''
    DefaultLimitNOFILE=1048576
  '';

  systemd.user.extraConfig = ''
    DefaultLimitNOFILE=1048576
  '';

  programs = {
    steam = {
      enable = true;
    };
    gamemode = {
      enable = true;
    };
  };
}
