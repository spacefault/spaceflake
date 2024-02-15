{...}: {
  system.autoUpgrade = {
    enable = true;
    flake = "github:spacefault/spaceflake#daisy";
    dates = "minutely";
    flags = ["--option" "tarball-ttl" "0"];
  };
  services = {
    devmon.enable = true;
    dbus.enable = true;
    openssh = {
      enable = true;
      settings.PasswordAuthentication = false;
      settings.KbdInteractiveAuthentication = true;
      ports = [22];
    };
    fail2ban = {
      enable = true;
      maxretry = 5;
      bantime = "24h";
      bantime-increment = {
        enable = true;
        formula = "ban.Time * math.exp(float(ban.Count+1)*banFactor)/math.exp(1*banFactor)";
        maxtime = "168h";
        overalljails = true;
      };
    };
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
  };
  powerManagement = {
    cpuFreqGovernor = "performance";
  };
}
