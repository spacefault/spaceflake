{...}: {
  programs.vscode = {
    enable = true;
    userSettings = {
      "window.titleBarStyle" = "custom"; 
      "workbench.sideBar.location" = "right";
    };
  };
}
