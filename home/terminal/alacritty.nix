{pkgs, ...}: 
let
  alacrittyTmuxScript = pkgs.writeShellScript "alacritty-tmux.sh" ''
    SESSION_NAME="alacritty"

    if tmux has-session -t "$SESSION_NAME" 2>/dev/null; then
      WINDOW_ID=$(tmux new-window -t "$SESSION_NAME" -P -F "#{window_id}")
      tmux attach-session -t "$SESSION_NAME" \; select-window -t "$WINDOW_ID"
    else
      tmux new-session -s "$SESSION_NAME"
    fi

  '';
in 

{
  programs.alacritty = {
    enable = true;
    package = null;
    settings = {
      window = {
        opacity = 0.8;
        dynamic_title = true;
      };
      terminal.shell = {
        program = "${alacrittyTmuxScript}";
      };
      colors = {
        primary = {
          background = "0x000000";
        };
        normal = {
          black = "0x000000";
          red = "0xb21818";
          green = "0x18b218";
          yellow = "0xb26818";
          blue = "0x5454ff";
          magenta = "0xb218b2";
          cyan = "0x18b2b2";
          white = "0xb2b2b2";
        };
        bright = {
          black = "0x686868";
          red = "0xff5454";
          green = "0x54ff54";
          yellow = "0xffff54";
          blue = "0x5454ff";
          magenta = "0xff54ff";
          cyan = "0x54ffff";
          white = "0xffffff";
        };
      };
    };
  };
}
