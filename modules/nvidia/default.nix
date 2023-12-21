{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./nvidia.nix
  ];
}
