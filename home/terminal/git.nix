{...}: {
  programs.git = {
    enable = true;
    userName = "spacefault";
    userEmail = "74156492+spacefault@users.noreply.github.com";
    signing = {
      key = "F88AC463D7165F5F";
      signByDefault = true;
    };
  };
}
