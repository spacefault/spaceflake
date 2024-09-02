{...}: {
  services.dunst = {
    enable = true;
    settings = {
      global = {
        format = ''<b>%s</b>\n%b'';
        icon_path = "~/.local/share/icons/";
        max_icon_size = 64;
        enable_recursive_icon_lookup = true;
        origin = "top-right";
        offset = "22x22";
        frame_width = 2;
        frame_color = "#e79cbf";
        separator_color = "frame";
        font = "Torus";
        corner_radius = 12;
        background = "#11111B";
        foreground = "#e79cbf";
        highlight = "#e79cbf";
      };
    };
  };
}
