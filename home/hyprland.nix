{
  config,
  pkgs,
  self,
  user,
  inputs,
  lib,
  wayland,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.default;
  };
}
