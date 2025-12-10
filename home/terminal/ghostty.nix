{pkgs, ...}:{
  programs.ghostty = {
    enable = true;
    package = null;
    systemd.enable = false;

    settings = {
      macos-titlebar-style = "native";
      macos-titlebar-proxy-icon = "hidden";
      macos-option-as-alt = "true";
      theme = "Adventure";

    };
  };
}
