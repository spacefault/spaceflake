{pkgs, ...}: {
  users.users.lily = {
    isNormalUser = true;
    description = "lily";
    extraGroups = ["networkmanager" "wheel" "audio" "video" "input" "libvirtd" "docker"];
    packages = with pkgs; [];
    shell = pkgs.zsh;
  };
}
