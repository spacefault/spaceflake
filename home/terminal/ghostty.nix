{...}: {
  programs.ghostty = {
    package = null;
    enable = true;
    settings = {
      macos-titlebar-style = "native";
      macos-titlebar-proxy-icon = "hidden";
      macos-option-as-alt = "true";
      theme = "Adventure";
    };
  };
}
