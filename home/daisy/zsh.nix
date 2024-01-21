{
  config,
  pkgs,
  self,
  user,
  ...
}: {
  programs = {
    zsh = {
      enable = true;
      initExtra = "autoload -Uz vcs_info\nprecmd() { vcs_info }\nzstyle ':vcs_info:git:*' formats '%b '\nsetopt PROMPT_SUBST\nPROMPT='%B%F{green}%n@%m%f%b %B%F{blue}%~%f%b %B%F{red}$vcs_info_msg_0_%f%b> '";
      history = {
        path = "/home/daisyadmin/.config/zsh/histfile";
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
