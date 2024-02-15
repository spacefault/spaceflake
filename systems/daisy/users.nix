{
  pkgs,
  ...
}: {
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
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIC05s+wxlFUMx9hjB9LeZLNhvzuC1khMNJgBQ2F5HY/w lily@blueberry"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAMcQFmwgMoiID6kaJSWQCbMKiGRvF5v0A5athSGruaD lily@cherry"
    ];
  };
  users = {
    motd = "welcome to daisy!";
  };
}
