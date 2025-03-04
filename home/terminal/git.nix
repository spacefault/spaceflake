{...}: {
  programs.git = {
    enable = true;
    userName = "spacefault";
    userEmail = "74156492+spacefault@users.noreply.github.com";
    signing = {
      key = "4A6CCCAE07AD8356";
      signByDefault = true;
    };
  };
}
