{ config, pkgs, ... }:

{
  users.users.devin = {
    isNormalUser = true;
    description = "devin";
    extraGroups = [ "networkmanager" "wheel" "audio" "video" "input" ];
    packages = with pkgs; [];
    shell = pkgs.zsh;
  };
}
