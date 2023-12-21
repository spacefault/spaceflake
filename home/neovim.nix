{
  config,
  pkgs,
  self,
  user,
  ...
}: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    plugins = [
      {
        plugin = pkgs.vimPlugins.catppuccin-nvim;
        config = "colorscheme catppuccin";
      }
    ];
    extraConfig = ''
      set number
      set expandtab
      set tabstop=4
      set shiftwidth=4
    '';
  };
}
