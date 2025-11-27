{...}: {
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings.mainBar = {
      layer = "top";
      position = "top";
      height = 26;
      modules-left = ["hyprland/workspaces" "hyprland/window" "mpris"];
      modules-center = [];
      modules-right = ["tray" "idle_inhibitor" "custom/notification" "wireplumber" "battery" "clock"];
      "hyprland/window" = {
        format = "{title}";
      };
      "idle_inhibitor" = {
        format = "{icon}";
        format-icons = {
          activated = "󰒳 ";
          deactivated = "󰒲 ";
        };
      };
      "clock" = {
        format = "{:%a %b %d %I:%M %p}";
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
        format-charging = "{icon} {capacity}% (Charging)";
        format-icons = ["󰁻" "󰁽" "󰁿" "󰂁" "󰁹"];
      };
      "wireplumber" = {
        format = "   {volume}%";
        tooltip = "true";
        tooltip-format = "{volume}%";
        format-muted = "   {volume}%";
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
        format = "{icon} {0}";
        format-icons = {
          notification = "󱥁 ";
          none = "󰍡 ";
          dnd-notification = "󱙍 ";
          dnd-none = "󱙍 ";
          inhibited-notification = "󱥁 ";
          inhibited-none = "󰍡 ";
          dnd-inhibited-notification = "󱙍 ";
          dnd-inhibited-none = "󱙍 ";
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
          font-family: Tahoma, Font Awesome;
          font-weight: normal;
          font-size: 14px;
          min-height: 0;
      }

      #waybar {
          background-color: rgba(30,33,40,0.7);
          color: #D8DEE9;
          transition-property: background-color;
          transition-duration: .5s;
          font-size: 11px;
          font-weight: normal;
      }

      #window {
          /* font-family: Helvetica Neue Light; */
      }

window#waybar.hidden {
  opacity: 0.2;
}

#waybar.empty #window {
  background-color: transparent;
}


#window {
  margin: 2;
  padding-left: 8;
  padding-right: 8;
  background-color: rgba(0,0,0,0.3);
  font-size:14px;
  font-weight: bold;
}

button {
  /* Use box-shadow instead of border so the text isn't offset */
  box-shadow: inset 0 -3px transparent;
  /* Avoid rounded borders under each button name */
  border: none;
  border-radius: 0;
}

/* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
button:hover {
  background: inherit;
  border-top: 2px solid #c9545d;
}

#workspaces button {
  padding: 0 4px;
  color: #FFFFFF; 
}

#workspaces button:hover {
}

#workspaces button.focused {
  /*    box-shadow: inset 0 -2px #c9545d; */
  background-color: rgba(0,0,0,0.3);
  color:#c9545d;
  border-top: 2px solid #c9545d;
}

#workspaces button.active {
  /*    box-shadow: inset 0 -2px #c9545d; */
  background-color: rgba(0,0,0,0.3);
  color:#ffffff;
  border-top: 1px solid #c9545d;
}

#workspaces button.urgent {
  background-color: #eb4d4b;
}

#mode {
  background-color: #64727D;
  border-bottom: 3px solid #ffffff;
}

#clock,
#battery,
#cpu,
#memory,
#disk,
#temperature,
#backlight,
#network,
#pulseaudio,
#wireplumber,
#custom-media,
#tray,
#mode,
#idle_inhibitor,
#scratchpad,
#custom-notification,
#mpris {
  margin: 2px;
  padding-left: 4px;
  padding-right: 4px;
  background-color: rgba(0,0,0,0.3);
  color: #ffffff;
}

/* If workspaces is the leftmost module, omit left margin */
.modules-left > widget:first-child > #workspaces {
  margin-left: 0;
}

/* If workspaces is the rightmost module, omit right margin */
.modules-right > widget:last-child > #workspaces {
  margin-right: 0;
}

#clock {
  font-size:14px;
  font-weight: bold;
}

#battery icon {
  color: red;
}

#battery.charging, #battery.plugged {
  color: #ffffff;
  background-color: #26A65B;
}

@keyframes blink {
  to {
    background-color: #ffffff;
    color: #000000;
  }
}

#battery.warning:not(.charging) {
  background-color: #f53c3c;
  color: #ffffff;
  animation-name: blink;
  animation-duration: 0.5s;
  animation-timing-function: linear;
  animation-iteration-count: infinite;
  animation-direction: alternate;
}

#battery.critical:not(.charging) {
  background-color: #f53c3c;
  color: #ffffff;
  animation-name: blink;
  animation-duration: 0.5s;
  animation-timing-function: linear;
  animation-iteration-count: infinite;
  animation-direction: alternate;
}

label:focus {
  background-color: #000000;
}

#network.disconnected {
  background-color: #f53c3c;
}

#temperature.critical {
  background-color: #eb4d4b;
}

#idle_inhibitor.activated {
  background-color: #ecf0f1;
  color: #2d3436;
}

#tray > .passive {
  -gtk-icon-effect: dim;
}

#tray > .needs-attention {
  -gtk-icon-effect: highlight;
  background-color: #eb4d4b;
}

/*

window#waybar.solo {
background-color: #FFFFFF;
}

window#waybar.termite {
background-color: #3F3F3F;
}

window#waybar.chromium {
background-color: #000000;
border: none;
}
 */
    '';
  };
}
