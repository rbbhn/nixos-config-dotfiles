{ pkgs, inputs, username, stateVersion, ... }: {
  #imports = [
  #    inputs.nvf.homeManagerModules.default
  #    inputs.niri.homeModules.niri
  #
  #    ./fastfetch
  #    ./fuzzel
  #    ./shell
  #    ./nvf
  #    ./spotify-tui
  #  ]
  #  ++ lib.optional toad ./wayland;

  home.username = "${username}";
  home.homeDirectory = "/home/${username}";

  home.packages = with pkgs; [
    pipes
  ];

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
  home.stateVersion = "${stateVersion}";
}
