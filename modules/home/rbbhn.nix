{ pkgs, inputs, username, stateVersion, ... }: {
  imports = [
    ./stylix.nix
    ./fastfetch
  ];

  home.username = "${username}";
  home.homeDirectory = "/home/${username}";

  home.packages = with pkgs; [
    pipes
    cmatrix
  ];

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
  home.stateVersion = "${stateVersion}";
}
