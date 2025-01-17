{ pkgs, ... }: {
  fonts.packages = with pkgs; [ # Include fonts
    (nerdfonts.override { fonts = [ "Terminus" ]; })
  ];
}
