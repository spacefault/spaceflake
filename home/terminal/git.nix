{...}: {
  programs.git = {
    enable = true;
    userName = "spacefault";
    userEmail = "74156492+spacefault@users.noreply.github.com";
    signing = {
      key = "002CED276239DDF9";
      signByDefault = true;
    };
    aliases = {
      lg = "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %aN%C(reset)%C(auto)%d%C(reset)' --all";
    };
  };
}
