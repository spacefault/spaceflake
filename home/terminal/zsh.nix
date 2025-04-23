{...}: {
  programs = {
    zsh = {
      enable = true;
      initContent = "DISABLE_AUTO_TITLE=false\nautoload -Uz vcs_info\nprecmd() { vcs_info }\nzstyle ':vcs_info:git:*' formats '%b '\nsetopt PROMPT_SUBST\nPROMPT='%B%F{243}%n %bon %B%m%f%b %B%F{197}%2~%f%b %B%F{39}$vcs_info_msg_0_%f%b> '";
      history.path = "$XDG_STATE_HOME/zsh/history";
      dotDir = ".config/zsh";
      shellAliases = {
        grep = "grep --color";
        ip = "ip --color";
        l = "exa -T -L 2";
        li = "exa -l";
        vim = "nvim";
        nixrbs = "nixos-rebuild switch --flake .# --use-remote-sudo --verbose";
        nixrbb = "nixos-rebuild boot --flake .# --use-remote-sudo --verbose";
      };
    };
  };
}
