{ pkgs, config, ... }: {
  stylix = {
    enable = true;
    autoEnable = true;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/mocha.yaml";;
    image = config.lib.stylix.pixel "base0A";;

    targets.gtk.enable = false;
  };
}
