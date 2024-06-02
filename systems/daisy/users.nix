{pkgs, ...}: {
  users.users.daisyadmin = {
    isNormalUser = true;
    description = "sysadmin";
    extraGroups = ["networkmanager" "wheel" "audio" "video" "input"];
    packages = with pkgs; [];
    shell = pkgs.zsh;
    # openssh.authorizedKeys.keyFiles = [
    #   /etc/nixos/ssh/authorized_keys
    # ];
    openssh.authorizedKeys.keys = [
      ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKhnw4C62bwoG9Xon0cHgoa0hJi1nLzVUsqqydJBtZ0s lily@cherry
    ];
  };
  users = {
    motd = "welcome to daisy!";
  };
}
