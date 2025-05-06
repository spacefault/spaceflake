{pkgs, ...}:

{
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd ="hyprctl dispatch dpms on";
      };

      listener = [
        {
        timeout = 150;
        on-timeout = "brightnessctl -s set 10";
        on-resume = "brightnessctl -r";
        }

       {
        timeout = 150;
        on-timeout = "brightnessctl -sd rgb:kbd_backlight set 0";
        on-resume = "brightnessctl -rd rgb:kbd_backlight";
      }

      {
        timeout = 200;
        on-timeout = "loginctl lock-session";
      }


      {
        timeout = 330;
        on-timeout = "hyprctl dispatch dpms off";
        on-resume = "hyprctl dispatch dpms on && brightnessctl -r";
      }

      {
        timeout = 250;
        on-timeout = "systemctl suspend";
      }
    ];
  };
};
}
