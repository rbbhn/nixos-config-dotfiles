{ pkgs, stylix, ... }: let
  theme = "${pkgs.base16-schemes}/share/themes/mocha.yaml";
  wallpaper = pkgs.runCommand "image.png" {} ''
    COLOR=$(${pkgs.yq}/bin/yq -r .base00 ${theme})
    COLOR="#"$COLOR
    ${pkgs.imagemagick}/bin/magick -size 2256x1504 xc:$COLOR $out
  '';
in {
  stylix = {
    enable = true;
    autoEnable = true;

    image = wallpaper;
    base16Scheme = theme;

    targets.gtk.enable = false;
  };
}
