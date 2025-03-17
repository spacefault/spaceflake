{...}: {
  programs.vscode = {
    enable = true;
    profiles.default.userSettings = {
      "window.titleBarStyle" = "custom";
      "workbench.sideBar.location" = "right";
    };
  };
}
