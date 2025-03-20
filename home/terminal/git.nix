{...}: {
  programs.git = {
    enable = true;
    userName = "spacefault";
    userEmail = "74156492+spacefault@users.noreply.github.com";
    signing = {
      key = "8DF227F0A0189DD2";
      signByDefault = true;
    };
  };
}
