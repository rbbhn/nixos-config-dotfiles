{ pkgs, username, stateVersion, ... }: {
  imports = [
    ./home-manager.nix # DO NOT REMOVE
    ./fastfetch.nix
    ./stylix.nix
  ];

  home.packages = with pkgs; [
    pipes
    cmatrix
  ];
}
