{
  config,
  pkgs,
  self,
  user,
  ...
}: {
  programs.neovim = {
    enable = true;
    extraConfig = ''
      set number
      set expandtab
      set tabstop=4
      set shiftwidth=4
    '';
  };
}
