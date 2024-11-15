{...}: {
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings.mainBar = {
      layer = "top";
      position = "top";
      height = 24;
      modules-left = ["hyprland/workspaces"];
      modules-center = ["clock" "mpris"];
      modules-right = ["tray" "custom/notification" "wireplumber" "battery"];
      "hyprland/window" = {
        format = "{title}";
      };
      "clock" = {
        format = "{:%m/%d/%Y @ %I:%M %p}";
        tooltip-format = "<tt><big>{calendar}</big></tt>";
      };
      "battery" = {
        bat = "BAT0";
        interval = 1;
        states = {
          "warning" = 20;
          "critical" = 10;
        };
        format = "{icon} {capacity}%";
        format-icons = ["󰁻" "󰁽" "󰁿" "󰂁" "󰁹"];
      };
      "wireplumber" = {
        format = "V: {volume}%";
        tooltip = "true";
        tooltip-format = "{volume}%";
        format-muted = "X: {volume}%";
        on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
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
      "custom/notification" = {
        tooltip = false;
        format = "{icon} ";
        format-icons = {
          notification = " !";
          none = "";
          dnd-notification = " !";
          dnd-none = "";
          inhibited-notification = " !";
          inhibited-none = "";
          dnd-inhibited-notification = " !";
          dnd-inhibited-none = "";
        };
        return-type = "json";
        exec-if = "which swaync-client";
        exec = "swaync-client -swb";
        on-click = "swaync-client -t -sw";
        on-click-right = "swaync-client -d -sw";
        escape = true;
      };
    };
    style = ''
      * {
          border: none;
          border-radius: 0;
          font-family: Torus;
          font-weight: bold;
          font-size: 14px;
          min-height: 0;
      }

      #waybar {
          background-color: rgba(30,33,40,0.7);
          color: #D8DEE9;
          transition-property: background-color;
          transition-duration: .5s;
          font-size: 11px;
          font-weight: bold;
      }

      #window {
          font-weight: bold;
          font-family: Torus;
      }

      workspaces {
          padding: 0 5px;
      }


      #workspaces button {
          padding: 0 5px;
          color: #808080;
      }

      #workspaces button.active {
          color: #FFFFFF;
      }

      #mode {
          background: #64727D;
          border-bottom: 3px solid white;
      }

      #clock, #battery, #cpu, #memory, #network, #wireplumber, #tray, #custom-weather {
          padding: 0 5px;
          margin: 0 2px;
      }

      #clock {
          font-weight: bold;
      }

      #battery {
      }

      #battery icon {
          color: red;
      }

      #battery.charging {
      }

      @keyframes blink {
          to {
              background-color: #ffffff;
              color: black;
          }
      }

      #battery.warning:not(.charging) {
          color: white;
          animation-name: blink;
          animation-duration: 0.5s;
          animation-timing-function: linear;
          animation-iteration-count: infinite;
          animation-direction: alternate;
      }

      #cpu {
      }

      #memory {
      }

      #network {
      }

      #network.disconnected {
          background: #f53c3c;
      }

      # wireplumber {
      }

      #custom-spotify {
          color: rgb(102, 220, 105);
      }

      #tray {
      }

    '';
  };
}
