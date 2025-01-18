{ pkgs, inputs, username, stateVersion, ... }: {
  imports = [
    ./stylix.nix
  ]

  home.username = "${username}";
  home.homeDirectory = "/home/${username}";

  home.packages = with pkgs; [
    pipes
  ];

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
  home.stateVersion = "${stateVersion}";
}
