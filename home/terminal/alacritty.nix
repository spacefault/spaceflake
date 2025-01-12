{pkgs, ...}: {
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        opacity = 0.8;
        dynamic_title = true;
      };
      terminal.shell = {
        program = "${pkgs.tmux}/bin/tmux";
      };
      colors = {
        primary = {
          background = "0x000000";
        };
        normal = {
          black = "0x000000";
          red = "0xb21818";
          green = "0x18b218";
          yellow = "0xb26818";
          blue = "0x5454ff";
          magenta = "0xb218b2";
          cyan = "0x18b2b2";
          white = "0xb2b2b2";
        };
        bright = {
          black = "0x686868";
          red = "0xff5454";
          green = "0x54ff54";
          yellow = "0xffff54";
          blue = "0x5454ff";
          magenta = "0xff54ff";
          cyan = "0x54ffff";
          white = "0xffffff";
        };
      };
    };
  };
}
