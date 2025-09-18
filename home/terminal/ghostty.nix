{pkgs, ...}: let
  ghosttyTmuxScript = pkgs.writeShellScript "ghostty-tmux.sh" ''
SESSION_NAME="ghostty"

if tmux has-session -t "$SESSION_NAME" 2>/dev/null; then
  WINDOW_ID=$(tmux new-window -t "$SESSION_NAME" -P -F "#{window_id}")
  tmux attach-session -t "$SESSION_NAME" \; select-window -t "$WINDOW_ID"
else
  tmux new-session -s "$SESSION_NAME"
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
