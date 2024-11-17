{
  pkgs,
  inputs,
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
    HYPRCURSOR_THEME = "macOS";
  };
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    systemd.enable = true;
    settings = {
      exec-once = [
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
        "udiskie --appindicator --automount"
        "systemctl --user start polkit-gnome-authentication-agent-1.service"
        "/run/wrappers/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh"
        "wlsunset -S 06:30 -s 20:00"
        "hyprctl setcursor Adwaita 24"
        "swww init"
        "swaync"
        "${pkgs.waybar}/bin/waybar"
        "sleep 5 && nm-applet && blueman-applet"
      ];
      general = {
        gaps_in = 3;
        gaps_out = 5;
        border_size = 1;
        "col.active_border" = "rgb(f49d61)";
        "col.inactive_border" = "rgb(eb7637)";
      };
      # stolen from https://github.com/parliamentbomber/parlbomb/blob/master/home/programs/hyprland/settings.nix
      monitor =
        lib.mapAttrsToList (name: m: let
          resolution = "${toString m.width}x${toString m.height}@${
            toString m.refreshRate
          }";
          position = "${toString m.x}x${toString m.y}";
        in "${name},${
          if m.enabled
          then "${resolution},${position},1"
          else "disable"
        }")
        config.monitors;
      debug = {
        disable_logs = false;
        enable_stdout_logs = true;
        damage_tracking = 0;
      };
      gestures = {
        workspace_swipe = true;
      };
      input = {
        #kb_layout = "us";
        #kb_variant = "qwerty";
        #kb_options = "compose:rctrl";
        follow_mouse = 1;
        sensitivity = 0;
        touchpad.natural_scroll = true;
      };
      decoration = {
        rounding = 0;
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          new_optimizations = 1;
        };
        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgba(2d1e16ee)";
        };
      };
      render = {
        explicit_sync = 1;
      };
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
        vrr = 1;
      };
      layerrule = [
        "blur, waybar"
        "ignorezero, waybar"
      ];
      windowrule = [
        "float,title:^(Calculator)(.*)$"
        "float,title:^(Friends)(.*)$"
        "size 682,697,title:^(Friends)(.*)$"
        "float,title:^(fcitx5)(.*)$"
        "float,title:^(File Operation Progress)(.*)$"
        "size 593,95,title:^(File Operation Progress)(.*)$"
      ];
      bindm = [
        "${mod}, mouse:272, movewindow"
        "${mod}, mouse:273, resizewindow"
      ];
      bind =
        [
          "${mod}, RETURN, exec, alacritty"
          "${mod}, SPACE, exec, anyrun"
          "${mod}, E, exec, thunar"
          "${mod}, W, exec, firefox -p"
          ", PRINT, exec, grimblast --freeze copy area"
          "${mod}, L, exec, swaylock --clock --indicator --indicator-radius 100 --indicator-thickness 7 --effect-blur 7x5"
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
          ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
          ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
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
