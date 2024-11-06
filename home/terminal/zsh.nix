{...}: {
  programs = {
    zsh = {
      enable = true;
      initExtra = "DISABLE_AUTO_TITLE=false\nautoload -Uz vcs_info\nprecmd() { vcs_info }\nzstyle ':vcs_info:git:*' formats '%b '\nsetopt PROMPT_SUBST\nPROMPT='%B%F{243}%n %bon %B%m%f%b %B%F{197}%2~%f%b %B%F{39}$vcs_info_msg_0_%f%b> '";
      history.path = "/home/devin/.config/zsh/histfile";
      dotDir = ".config/zsh";
      shellAliases = {
        grep = "grep --color";
        ip = "ip --color";
        l = "ls -lAh --color";
        ls = "ls -lAh --color";
        vim = "nvim";
      };
    };
  };
}
