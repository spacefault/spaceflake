{pkgs, ...}: let
  ghosttyTmuxScript = pkgs.writeShellScript "ghostty-tmux.sh" ''
    #!/bin/bash
    SESSION_NAME="ghostty"

    if tmux has-session -t "$SESSION_NAME" 2>/dev/null; then
      tmux attach-session -t "$SESSION_NAME"
    else
      tmux new-session -s "$SESSION_NAME" -d
      tmux attach-session -t "$SESSION_NAME"
    fi
  '';
in {
  programs.ghostty = {
    enable = true;
    package = null;

    settings = {
      macos-titlebar-style = "native";
      macos-titlebar-proxy-icon = "hidden";
      macos-option-as-alt = "true";
      theme = "Adventure";

      command = "${pkgs.bash}/bin/bash -c '${ghosttyTmuxScript}'";
    };
  };
}
