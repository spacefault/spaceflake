{
  pkgs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    ffmpeg
    adwaita-icon-theme
    htop
    sbctl
    killall
    networkmanagerapplet
    cups-filters
    libimobiledevice
    ifuse
    gcc
    libsForQt5.ksshaskpass
    pinentry
    gh
    gnumake
    smartmontools
    nautilus-python
    gst_all_1.gstreamer
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-plugins-ugly
    gst_all_1.gst-libav
    gst_all_1.gst-vaapi
  ];

  environment.gnome.excludePackages = (with pkgs; [
    gnome-console
  ]);

  programs = {
    seahorse = {
      enable = false;
    };
    zsh = {
      enable = true;
    };
    dconf = {
      enable = true;
    };
    nix-ld = {
      enable = true;
    };
    nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 4d --keep 3";
    };
    #ssh = {
    #  startAgent = true;
    #  askPassword = pkgs.lib.mkForce "${pkgs.ksshaskpass.out}/bin/ksshaskpass";
    #};
    gnupg = {
      agent = {
        enable = true;
        #enableSSHSupport = true;
        #enableExtraSocket = true;
        #pinentryPackage = lib.mkForce pkgs.pinentry-gnome;
      };
    };
  };
}
