{pkgs, ...}: {
  programs.ghostty = {
    package = pkgs.emptyDirectory;
    enable = true;
    settings = {
        macos-titlebar-style = "tabs";
        macos-titlebar-proxy-icon = "hidden";
        macos-option-as-alt = "true";
        theme = "Apple System Colors Light";
    };
  };
}
