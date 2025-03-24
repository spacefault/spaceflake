{...}: {
  programs.git = {
    enable = true;
    userName = "spacefault";
    userEmail = "74156492+spacefault@users.noreply.github.com";
    signing = {
      key = "B18BB62EF51CDDEF";
      signByDefault = true;
    };
  };
}
