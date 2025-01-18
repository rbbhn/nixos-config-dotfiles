{ pkgs, stylix, ... }: {
  stylix.enable = true;
  stylix.autoEnable = false;

  stylix.image = ./wallpaper.png;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/mocha.yaml";
}
