{
  config,
  pkgs,
  self,
  user,
  ...
}: let
  binaryImage = builtins.path {
    path = ./extra/nixos_dark.svg;
    name = "nixos_dark.svg";
  };
in let
  weatherScript = builtins.path {
    path = ./extra/waybar-wttr.py;
    name = "waybar_wttr.py";
  };
in let
  cssFile = builtins.path {
    path = ./extra/waybarstyle.css;
    name = "waybarstyle.css";
  };
in {
  programs = {
    waybar = {
      style = cssFile;
      enable = true;
      systemd = {
        enable = true;
      };
      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          height = 14;
          margin-top = 5;
          margin-left = 5;
          margin-right = 5;
          modules-left = ["custom/icon" "hyprland/workspaces" "hyprland/window" "privacy"];
          modules-center = [];
          modules-right = ["tray" "custom/weather" "custom/kernel" "cpu" "memory" "custom/notification" "wireplumber" "battery" "network" "hyprland/language" "clock" ];
          "memory" = {
            interval = 10;
            format = "  {}%";
            max-length = 10;
          };
          "cpu" = {
            interval = 10;
            format = "  {}%";
            max-length = 10;
          };
          "custom/kernel" = {
            format = "󰣐  {}";
            exec = "uname -r";
          };
          "hyprland/language" = {
            format = "󰌌   {}";
            format-en = "en, US";
          };
          "hyprland/window" = {
            format = "{}";
          };
          "mpris" = {
            format = "{player_icon} {title} - {artist}";
            format-paused = "{status_icon} {title} - {artist}";
            player-icons = {
              "default" = " ";
            };
            status-icons = {
              "paused" = "⏸";
            };
          };
          "custom/icon" = {
            exec = "echo '  '";
            format = "{}";
          };
          "privacy" = {
            icon-spacing = 4;
            icon-size = 18;
            transition-duration = 250;
            modules = [
              {
                type = "screenshare";
                tooltip = true;
                tooltip-icon-size = 24;
              }
              {
                type = "audio-out";
                tooltip = true;
                tooltip-icon-size = 24;
              }
              {
                type = "audio-in";
                tooltip = true;
                tooltip-icon-size = 24;
              }
            ];
          };
          "custom/weather" = {
            format = " {}";
            tooltip = "true";
            interval = 3600;
            exec = weatherScript;
            return-type = "json";
          };
          "hyprland/workspaces" = {
            disable-scroll = "true";
            all-outputs = "true";
            on-click = "activate";
            format = "{}";
          };
          "tray" = {
            icon-size = 13;
            spacing = 10;
          };
          "battery" = {
            bat = "BAT0";
            interval = 1;
            states = {
              "warning" = 20;
              "critical" = 10;
            };
            format = " {icon} {capacity}%";
            format-icons = ["󰁻" "󰁽" "󰁿" "󰂁" "󰁹"];
          };
          "clock" = {
            format = "{:   %I:%M %p}";
            format-alt = "{:   %Y-%m-%d}";
            tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          };
          "network" = {
            format-wifi = "󰤨  {essid} ({signalStrength}%)";
            tooltip-format-wifi = "{ifname} via {gwaddr}";
            format-ethernet = "󰈀   Connected";
            tooltip-format = "{ifname} via {gwaddr}";
            format-linked = "{ifname} (No IP)";
            format-disconnected = "⚠  Disconnected";
            format-alt = "{ifname}: {ipaddr}/{cidr}";
          };
          "wireplumber" = {
            format = "{icon}  {volume}%";
            tooltip = "true";
            tooltip-format = "{volume}";
            format-muted = "  Muted";
            on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
            format-icons = ["" "" ""];
          };
          "custom/power" = {
            format = "󰩈";
            on-click = "wlogout";
          };
        };
      };
    };
  };
}
