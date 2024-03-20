{...}: let
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
          modules-left = ["custom/icon" "custom/seperator" "hyprland/workspaces" "mpris" ];
          modules-center = ["clock" "custom/weather"];
          modules-right = ["tray" "custom/notification" "custom/seperator" "wireplumber" "battery" "network" "hyprland/language" "custom/seperator" "custom/power"];
          "custom/notification" = {
            tooltip = false;
            format = "{icon}";
            format-icons = {
              notification = "   ! ";
              none = "  ";
              dnd-notification = "    ! ";
              dnd-none = "  ";
              inhibited-notification = "   ! ";
              inhibited-none = "  ";
              dnd-inhibited-notification = "   ! ";
              dnd-inhibited-none = "  ";
            };
            return-type = "json";
            exec-if = "which swaync-client";
            exec = "swaync-client -swb";
            on-click = "swaync-client -t -sw";
            on-click-right = "swaync-client -d -sw";
            escape = true;
          };
          "custom/seperator" = {
            exec = "echo '󰇙'";
            format = "{}";
          };
          "hyprland/language" = {
            format = "󰌌";
            format-alt = "󰌌   {}";
            format-en = "en, US";
            tooltip = true;
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
            exec = "echo '   '";
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
            format = "{icon}";
            format-icons = ["󰁻" "󰁽" "󰁿" "󰂁" "󰁹"];
            tooltip-format = "{capacity}%";
          };
          "clock" = {
            format = "{:%I:%M %p  %A %b %d}";
            format-alt = "{:   %Y-%m-%d}";
            tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          };
          "network" = {
            format-wifi = "󰤨";
            format-ethernet = "󰈀";
            tooltip-format = "{ifname} via {gwaddr}";
            format-linked = "{ifname} (No IP)";
            format-disconnected = "⚠  Disconnected";
            format-alt = "{ifname}: {ipaddr}/{cidr}";
            tooltip-format-wifi = "{essid} ({signalStrength}%)";
          };
          "wireplumber" = {
            format = "{icon}";
            tooltip = "true";
            tooltip-format = "{volume}";
            format-muted = "󰝟";
            on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
            format-icons = ["" "" ""];
          };
          "custom/power" = {
            format = "⏻ ";
            on-click = "wlogout";
          };
        };
      };
    };
  };
}
