{
  pkgs,
  config,
  lib,
  ...
}: let
  mod = "SUPER";
  workspaces = builtins.concatLists (builtins.genList (
      x: let
        ws = let
          c = (x + 1) / 10;
        in
          builtins.toString (x + 1 - (c * 10));
      in [
        "${mod}, ${ws}, workspace, ${toString (x + 1)}"
        "${mod} SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
      ]
    )
    10);
in {
  home.sessionVariables = {
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    XDG_SESSION_TYPE = "wayland";
    XCURSOR_THEME = "macOS-Monterey";
    XCURSOR_SIZE = 24;
  };
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
    systemd.enable = true;
    settings = {
      exec-once = [
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
        "${pkgs.networkmanagerapplet}/bin/nm-applet"
        "hyprctl setcursor macOS 22"
        "${pkgs.blueman}/bin/blueman-applet"
        "${pkgs.udiskie}/bin/udiskie --appindicator --automount"
        "systemctl --user start polkit-gnome-authentication-agent-1.service"
        "${pkgs.gnome-keyring}/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh"
        "${pkgs.wlsunset}/bin/wlsunset -S 05:00 -s 19:00"
        "${pkgs.swww}/bin/swww-daemon"
        "${pkgs.swww}/bin/swww img ${./wallpaper.jpg}"
        "${pkgs.swaynotificationcenter}/bin/swaync"
        "${pkgs.swayosd}/bin/swayosd-server"
        "fcitx5 -d -r"
        "fcitx5-remote -r"
      ];
      general = {
        gaps_in = 3;
        gaps_out = 5;
        border_size = 1;
        "col.active_border" = "rgb(d2a1d2)";
        "col.inactive_border" = "rgb(95537b)";
      };
      # stolen from https://github.com/parliamentbomber/parlbomb/blob/master/home/programs/hyprland/settings.nix
      monitor =
        lib.mapAttrsToList (name: m: let
          resolution = "${toString m.width}x${toString m.height}@${
            toString m.refreshRate
          }";
          position = "${toString m.x}x${toString m.y}";
          scale = "${toString m.scale}";
          transformValue = "${toString m.transformValue}";
        in "${name},${
          if m.enabled
          then "${resolution},${position},${scale},transform,${transformValue}"
          else "disable"
        }")
        config.monitors;
      debug = {
        disable_logs = false;
        enable_stdout_logs = true;
        damage_tracking = 0;
      };
      gesture = [
        "4, horizontal, workspace"
      ];

      input = {
        #kb_layout = "us";
        #kb_variant = "qwerty";
        kb_options = "ctrl:nocaps";
        follow_mouse = 1;
        sensitivity = 0;
        left_handed = false;
        touchpad = {
          natural_scroll = true;
          drag_3fg = true;
        };
      };
      decoration = {
        rounding = 0;
        blur = {
          popups = true;
          contrast = 1;
          passes = 2;
          size = 1;
          special = true;
          brightness = 1;
        };
        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgba(2d1e16ee)";
        };
      };
      #render = {
      #  explicit_sync = 1;
      #};
      dwindle = {
        pseudotile = true;
        preserve_split = "yes";
        special_scale_factor = 0.9;
      };
      animations = {
        enabled = true;
        bezier = [
          "myBezier, 0.05, 0.9, 0.1, 1.05"
        ];
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
          "specialWorkspace, 1, 6, default, slidevert"
        ];
      };
      misc = {
        disable_splash_rendering = true;
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
        middle_click_paste = false;
        vrr = 1;
      };
      layerrule = [
        "blur, waybar"
        "ignorezero, waybar"
      ];
      windowrule = [
        "float,title:^(Calculator)(.*)$"
        "float,title:^(Friends)(.*)$"
        "float,title:^(fcitx5)(.*)$"
        "pseudo,title:^(fcitx5)(.*)$"
        "float,title:^(File Operation Progress)(.*)$"
      ];
      bindm = [
        "${mod}, mouse:272, movewindow"
        "${mod}, mouse:273, resizewindow"
      ];
      bind =
        [
          "${mod}, RETURN, exec, ghostty"
          "${mod}, SPACE, exec, bemenu-run -H 26"
          "${mod}, E, exec, dolphin"
          "${mod}, W, exec, firefox -p default"
          "${mod}, R, exec, google-chrome-stable"
          "${mod}, C, exec, thunderbird"
          ", PRINT, exec, grimblast --notify --freeze copysave area"
          "${mod}, L, exec, hyprlock"
          "${mod}, Y, exec, wlogout"
          "${mod}, Q, killactive"
          "${mod}, O, togglefloating"
          "${mod}, P, pseudo"
          "${mod}, S, togglesplit"
          "${mod}, F, fullscreen"
          "${mod}, left, movefocus, l"
          "${mod}, right, movefocus, r"
          "${mod}, up, movefocus, u"
          "${mod}, down, movefocus, d"
          "${mod}, grave, togglespecialworkspace"
          "SUPERSHIFT, grave, movetoworkspace, special"
          ", XF86AudioRaiseVolume, exec, swayosd-client --output-volume raise"
          ", XF86AudioLowerVolume, exec, swayosd-client --output-volume lower"
          ", xf86monbrightnessup, exec, swayosd-client --brightness raise"
          ", xf86monbrightnessdown, exec, swayosd-client --brightness lower"
          ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
          ", XF86AudioPlay, exec, playerctl play-pause"
          ", XF86AudioPause, exec, playerctl play-pause"
          ", XF86AudioNext, exec, playerctl next"
          ", XF86AudioPrev, exec, playerctl previous"
        ]
        ++ workspaces;
    };
  };
}
