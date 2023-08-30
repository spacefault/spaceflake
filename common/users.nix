{ config, pkgs, ... }:

{
  users.users.devin = {
    isNormalUser = true;
    description = "devin";
    extraGroups = [ "networkmanager" "wheel" "audio" "video" "input" "libvirtd" ];
    packages = with pkgs; [];
    shell = pkgs.zsh;
  };
}
