{pkgs, ...}: {
  programs = {
    tmux = {
      enable = true;
      plugins = with pkgs.tmuxPlugins; [
        cpu
        power-theme
        resurrect
        continuum
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
        set-option -g automatic-rename on
        #set-option -g automatic-rename-format "#{b:pane_current_path}"
        set -g prefix M-a
        unbind C-b
        bind M-a send-prefix
        bind h select-pane -L
        bind j select-pane -D
        bind k select-pane -U
        bind l select-pane -R

        set -g @resurrect-dir '~/.tmux/resurrect'
        set -g @resurrect-capture-pane-contents 'on'
        set -g @continuum-restore 'on'
        set -g @continuum-save-interval '1'  
      '';
    };
  };
}
