{
  config,
  pkgs,
  self,
  user,
  ...
}: {
  programs.vscode = {
    enable = true;
    userSettings = {"window.titleBarStyle" = "custom";};
  };
}
