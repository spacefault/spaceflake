{...}: {
  programs.git = {
    enable = true;
    userName = "spacefault";
    userEmail = "74156492+spacefault@users.noreply.github.com";
    signing = {
      key = "68B88586B574840C";
      signByDefault = true;
    };
  };
}
