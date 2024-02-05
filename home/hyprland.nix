{
  config,
  pkgs,
  self,
  user,
  inputs,
  lib,
  wayland,
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
in let
  swaylockScript = pkgs.writeShellScript "swaylockScript" ''
     ${pkgs.swaylock-effects}/bin/swaylock \
    --screenshots \
    --clock \
    --indicator \
    --indicator-radius 100 \
    --indicator-thickness 7 \
    --effect-blur 7x5 \
    --effect-vignette 0.5:0.5 \
    --ring-color bb00cc \
    --key-hl-color 880033 \
    --line-color 00000000 \
    --inside-color 00000088 \
    --separator-color 00000000 \
    --grace 2 \
    --fade-in 0.2
  '';
in {
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    settings = {
      exec-once = [
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
        "udiskie --appindicator --automount"
        "systemctl --user start polkit-gnome-authentication-agent-1.service"
        "/run/wrappers/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh"
        "/home/lily/.config/hypr/scripts/initbackground.sh"
        "wlsunset -S 06:30 -s 20:00"
        "hyprctl setcursor Adwaita 24"
        "swww init"
      ];
      general = {
        gaps_in = 5;
        gaps_out = 5;
        border_size = 3;
        "col.active_border" = "rgb(ab76b0)";
        "col.inactive_border" = "rgb(762e75)";
      };
      gestures = {
        workspace_swipe = true;
      };
      input = {
        kb_layout = "us,ca";
        kb_variant = "qwerty";
        kb_options = "compose:rctrl";
        follow_mouse = 1;
        sensitivity = 0;
      };
      decoration = {
        rounding = 10;
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          new_optimizations = 1;
        };
        drop_shadow = "no";
        shadow_range = 4;
        shadow_render_power = 3;
        "col.shadow" = "rgba(2d1e16ee)";
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
      };
      monitor = [
        "HDMI-A-1,1920x1080@75, 0x0, 1"
      ];
      layerrule = [
        "blur, waybar"
        "ignorezero, waybar"
      ];
      windowrule = [
        "float,title:^(Calculator)(.*)$"
        "float,title:^(Friends)(.*)$"
        "size 682,697,title:^(Friends)(.*)$"
        "float,title:^(fcitx5)(.*)$"
      ];
      bindm = [
        "${mod}, mouse:272, movewindow"
        "${mod}, mouse:273, resizewindow"
      ];
      bind =
        [
          "${mod}, RETURN, exec, alacritty"
          "${mod}, SPACE, exec, anyrun"
          "${mod}, E, exec, nautilus"
          ", PRINT, exec, watershot -c | shadower | wl-copy"
          "${mod}, L, exec, ${swaylockScript.outPath}"
          "${mod}, Y, exec, wlogout"
          "${mod}, Q, killactive"
          "${mod}, O, togglefloating"
          "${mod}, P, pseudo"
          "${mod}, S, togglesplit"
          "${mod}, F, fullscreen"
          "${mod}, left, movefocus, 1"
          "${mod}, right, movefocus, r"
          "${mod}, up, movefocus, u"
          "${mod}, down, movefocus, d"
          "${mod}, grave, togglespecialworkspace"
          "SUPERSHIFT, grade, movetoworkspace, special"
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
