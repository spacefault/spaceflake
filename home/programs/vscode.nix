{...}: {
  programs.vscode = {
    enable = true;
    profiles.default.userSettings = {
      "window.titleBarStyle" = "custom";
      "workbench.sideBar.location" = "right";
      "github.copilot.enable" = {
        "*" = "false";
        "markdown" = "false";
        "scminput" = "false";
      };
    };
  };
}
