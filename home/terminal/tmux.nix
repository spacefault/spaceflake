{pkgs, ...}: {
  programs = {
    tmux = {
      enable = true;
      plugins = with pkgs.tmuxPlugins; [
        cpu
        power-theme
      ];
      extraConfig = ''
        # https://old.reddit.com/r/tmux/comments/mesrci/tmux_2_doesnt_seem_to_use_256_colors/
        set -g set-titles on
        set -g default-terminal "xterm-256color"
        set -ga terminal-overrides ",*256col*:Tc"
        set -ga terminal-overrides '*:Ss=\E[%p1%d q:Se=\E[ q'
        set-environment -g COLORTERM "truecolor"
        bind | split-window -h
        bind - split-window -v
        unbind '"'
        unbind %
        set -g mouse on
        set -g status-position bottom
        set -g status-justify left
        set -g status-style 'fg=red'
      '';
    };
  };
}
