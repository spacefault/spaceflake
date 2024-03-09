{pkgs, ...}: {
  users.mutableUsers = false;
  users.users.lily = {
    isNormalUser = true;
    hashedPasswordFile = "/persist/passwords/lily/lily";
    description = "lily";
    extraGroups = ["networkmanager" "wheel" "audio" "video" "input" "libvirtd" "docker"];
    packages = with pkgs; [];
    shell = pkgs.zsh;
  };
}
