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
    obs-studio
    #inputs.nix-gaming.packages.${pkgs.system}.osu-lazer-bin
    inputs.nix-gaming.packages.${pkgs.system}.osu-stable
    inputs.nix-gaming.packages.${pkgs.system}.wine-discord-ipc-bridge
    inputs.nix-gaming.packages.${pkgs.system}.wine-osu
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
