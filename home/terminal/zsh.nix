{...}: {
  programs = {
    zsh = {
      enable = true;
      initExtra = "DISABLE_AUTO_TITLE=false\nautoload -Uz vcs_info\nsetopt PROMPT_SUBST\nPROMPT='%B%F{243}%n on %m%f%b %B%F{197}%~%f%b > '";
      history = {
        path = "/home/lily/.config/zsh/histfile";
      };
      shellAliases = {
        grep = "grep --color";
        ip = "ip --color";
        l = "ls -lah --color";
        ls = "ls -lah --color";
        vim = "nvim";
      };
    };
  };
}
