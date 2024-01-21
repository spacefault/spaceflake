{
  config,
  pkgs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    wget
    htop
    killall
  ];
  programs = {
    zsh = {
      enable = true;
    };
    git = {
      enable = true;
    };
  };
}
