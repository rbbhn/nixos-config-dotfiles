{ pkgs, config, inputs, ... }: {
  imports = [
    stylix.nixosModules.stylix
  ];
  stylix = {
    enable = true;
    autoEnable = true;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/eighties.yaml";
    image = config.lib.stylix.pixel "base0A";
  };
}
