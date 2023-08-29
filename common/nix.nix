{ config, ... }:

{
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      allowed-users = [ "@wheel" "devin" ];
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
}
