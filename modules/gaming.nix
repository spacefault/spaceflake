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
    chatterino2
    discord
    mangohud
    inputs.nix-gaming.packages.${pkgs.hostPlatform.system}.osu-stable
    inputs.nix-gaming.packages.${pkgs.hostPlatform.system}.wine-discord-ipc-bridge
    inputs.nix-gaming.packages.${pkgs.hostPlatform.system}.wine-osu
  ];

  systemd = {
    extraConfig = ''DefaultLimitNOFILE=1048576'';
    user.extraConfig = ''DefaultLimitNOFILE=1048576'';
  };

  programs = {
    steam = {
      enable = true;
      gamescopeSession.enable = true;
      extraCompatPackages = [pkgs.proton-ge-bin];
      package = pkgs.steam.override {
        extraPkgs = pkgs:
          with pkgs; [
            keyutils
            libkrb5
            libpng
            libpulseaudio
            libvorbis
            stdenv.cc.cc.lib
            xorg.libXcursor
            xorg.libXi
            xorg.libXinerama
            xorg.libXScrnSaver
          ];
      };
    };
    gamemode = {
      enable = true;
    };
  };
}
