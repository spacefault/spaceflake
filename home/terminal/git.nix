{...}: {
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "spacefault";
        email = "74156492+spacefault@users.noreply.github.com";
      };
      signing = {
        key = "85AABA1FC9EC2A0A";
        signByDefault = true;
      };
      alias = {
        co = "checkout";
        br = "branch";
        ci = "commit";
        st = "status";
        mg = "merge";
        lg = "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %aN%C(reset)%C(auto)%d%C(reset)' --all";
      };

      core.editor = "nvim";
      pull.rebase = true;
      init.defaultBranch = "master";
    };
  };
}
