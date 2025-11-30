{
  lib,
  config,
  ...
}: {
  programs = {
    zsh = {
      enable = true;
      dotDir = "${config.xdg.configHome}/zsh";
      initContent = lib.mkOrder 1000 ''
        [[ ! $(command -v nix) && -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]] && source '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
        DISABLE_AUTO_TITLE=false
        autoload -Uz vcs_info
        precmd() { vcs_info }
        zstyle ':vcs_info:git:*' formats '%b '
        setopt PROMPT_SUBST
        PROMPT='%B%F{243}%n %bon %B%m%f%b %B%F{197}%2~%f%b %B%F{39}$vcs_info_msg_0_%f%b> '
      '';
      history = {
        append = true;
        share = true;
        size = 1000000;
        save = 1000000;
        path = "${config.home.homeDirectory}/.zsh_history";
      };
      shellAliases = {
        grep = "grep --color";
        ip = "ip --color";
        ls = "ls --color";
        la = "ls -lah --color";
        vim = "nvim";
        nixrbs = "nixos-rebuild switch --flake .# --use-remote-sudo --verbose";
        nixrbb = "nixos-rebuild boot --flake .# --use-remote-sudo --verbose";
      };
    };
  };
}
