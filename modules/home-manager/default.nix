{ pkgs, inputs, username, stateVersion, ... }: {
  imports = [
    ./${username}.nix # Import user-specific modules

    ./stylix.nix
    ./fastfetch.nix
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
