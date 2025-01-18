{ pkgs, config, ... }: {
  stylix = {
    enable = true;
    image = ./wallpaper.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/brushtrees-dark.yaml";
    fonts = {
      monospace = {
        package = (pkgs.nerdfonts.override { fonts = [ "Terminus" ]; });
        name = "Terminess Nerd Font Mono";
      };
      serif = config.stylix.fonts.monospace;
      sansSerif = config.stylix.fonts.monospace;
      emoji = config.stylix.fonts.monospace;
    };
  };
}
