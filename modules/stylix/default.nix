{ pkgs, config, ... }: {
  stylix = {
    enable = true;
    autoEnable = true;
    image = ./wallpaper.png;
    /*base16Scheme = "${pkgs.base16-schemes}/share/themes/atelier-plateau-light.yaml";
    fonts = {
      monospace = {
        package = (pkgs.nerdfonts.override { fonts = [ "Terminus" ]; });
        name = "Terminess Nerd Font Mono";
      };
      serif = config.stylix.fonts.monospace;
      sansSerif = config.stylix.fonts.monospace;
      emoji = config.stylix.fonts.monospace;
    };
    cursor = {
      package = pkgs.posy-cursors;
      name = "Posy's Cursor Black";
      size = 32;
    };*/
  };
}
