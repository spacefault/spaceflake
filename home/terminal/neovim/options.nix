{ pkgs, ... }: {
  config = {
    globals.mapleader = " ";
    options = {
      termguicolors = true;
      expandtab = true;
      smartcase = true;
      ignorecase = true;
      cmdheight = 0;
    };
    #autoCmd = [
    # {
    # event = "FileType";
    #   pattern = "nix";
    #   command = "setlocal tabstop=2 shiftwidth=2";
    # }
    #];
  };
}
