{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    prismlauncher
    ckan
    piper
    celeste64
    #lutris
    chatterino2
    discord
    mangohud
    obs-studio
    osu-lazer-bin
  ];

  #systemd = {
  #  extraConfig = ''DefaultLimitNOFILE=1048576'';
  #  user.extraConfig = ''DefaultLimitNOFILE=1048576'';
  #};

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
