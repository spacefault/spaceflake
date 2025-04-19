{
  inputs,
  pkgs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    prismlauncher
    ckan
    piper
    celeste64
    lutris
    #chatterino2
    discord
    mangohud
    obs-studio
    inputs.nix-gaming.packages.${pkgs.system}.osu-lazer-bin
    #inputs.nix-gaming.packages.${pkgs.system}.osu-stable
    #inputs.nix-gaming.packages.${pkgs.system}.wine-discord-ipc-bridge
    #inputs.nix-gaming.packages.${pkgs.system}.wine-osu
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
    };
    gamemode.enable = true;
  };
  nixpkgs.config.packageOverrides = pkgs: {
    steam = pkgs.steam.override {
      extraBwrapArgs = [
        "--bind $HOME/etc/steamhome $HOME"
        "--unsetenv XDG_CACHE_HOME"
        "--unsetenv XDG_CONFIG_HOME"
        "--unsetenv XDG_DATA_HOME"
        "--unsetenv XDG_STATE_HOME"
      ];
      extraPkgs = pkgs:
        with pkgs; [
          pango
          gamemode
          libthai
          harfbuzz
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
}
