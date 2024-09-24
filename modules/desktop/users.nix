{pkgs, ...}: {
  users.users.lily = {
    isNormalUser = true;
    description = "lily";
    extraGroups = ["networkmanager" "wheel" "audio" "video" "input" "libvirtd" "docker" "scanner" "lp"];
    packages = [];
    shell = pkgs.zsh;
  };
}
