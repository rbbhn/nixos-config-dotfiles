{ pkgs, config, ... }: {
  stylix = {
    enable = true;
    autoEnable = true;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/terracotta-dark.yaml";
    image = config.lib.stylix.pixel "base0A";
  };
}
