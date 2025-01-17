{ pkgs, ... }: {
  programs.regreet = {
    enable = true;
    font.package = (pkgs.nerdfonts.override { fonts = [ "Terminus" ]; });
    font.name  = "Terminess Nerd Font Mono";
    font.size = 16;
    theme.package = pkgs.breeze-gtk;
    theme.name = "Breeze";
    iconTheme.package = pkgs.breeze-icons;
    iconTheme.name = "Breeze";
    cursorTheme.package = pkgs.posy-cursors;
    cursorTheme.name = "Posy's Cursor Black";
  };
}
