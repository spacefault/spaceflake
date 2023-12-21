{
  config,
  pkgs,
  input,
  ...
}: {
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    osu-lazer-bin
    prismlauncher
    ckan
    godot_4
    piper
  ];

  programs = {
    steam = {
      enable = true;
    };
  };
}
