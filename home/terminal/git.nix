{...}: {
  programs.git = {
    enable = true;
    userName = "spacefault";
    userEmail = "74156492+spacefault@users.noreply.github.com";
    signing = {
      key = "2F9AE33488378FEB";
      signByDefault = true;
    };
  };
}
