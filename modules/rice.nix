{
  inputs,
  pkgs,
  ...
}: {
  stylix = {
    enable = true;
    autoEnable = false;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-latte.yaml";
    targets = {
      gtk.enable = true;
    };
  };
}
