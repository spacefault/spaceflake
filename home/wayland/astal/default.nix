{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.ags.homeManagerModules.default];
  home.packages = with inputs.ags.packages.${pkgs.system}; [
    inputs.astal.packages.${pkgs.system}.default
    pkgs.fzf
  ];
  programs.ags = {
    enable = true;

    configDir = ./config;

    # additional packages to add to gjs's runtime
    extraPackages = with inputs.ags.packages.${pkgs.system}; [
      auth
      apps
      powerprofiles
      bluetooth
      hyprland
      mpris
      battery
      tray
      network
      wireplumber
      notifd
      pkgs.fzf
    ];
  };
}