{lib, ...}: {
  programs = {
    zsh = {
      enable = true;
      dotDir = ".config/zsh";
      initContent = lib.mkOrder 1000 ''
        DISABLE_AUTO_TITLE=false
        autoload -Uz vcs_info
        precmd() { vcs_info }
        zstyle ':vcs_info:git:*' formats '%b '
        setopt PROMPT_SUBST
        PROMPT='%B%F{243}%n %bon %B%m%f%b %B%F{197}%2~%f%b %B%F{39}$vcs_info_msg_0_%f%b> '
      '';
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
