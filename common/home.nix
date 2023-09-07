{ config, pkgs, self, user, ... }:
{
  home = {
    username = "devin";
    homeDirectory = "/home/devin";
    stateVersion = "23.05";
  };

  programs = {
    home-manager = {
      enable = true;
    };
    zsh = {
      enable = true;
      enableAutosuggestions = true;
      initExtra = "autoload -Uz vcs_info\nprecmd() { vcs_info }\nzstyle ':vcs_info:git:*' formats '%b '\nsetopt PROMPT_SUBST\nPROMPT='%B%F{green}%n@%m%f%b %B%F{blue}%~%f%b %B%F{red}$vcs_info_msg_0_%f%b> '";
      history = {
        path = "/home/devin/histfile";
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
