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
    piper
    discord
    nix-gaming.packages.${pkgs.hostPlatform.system}.osu-stable
    nix-gaming.packages.${pkgs.hostPlatform.system}.wine-discord-ipc-bridge
  ];

  programs = {
    steam = {
      enable = true;
    };
  };
}
