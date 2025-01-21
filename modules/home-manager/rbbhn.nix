{ pkgs, username, stateVersion, ... }: {
  imports = [
    ./fastfetch.nix
    ./home-manager.nix
    ./stylix.nix
  ];

  home.packages = with pkgs; [
    pipes
    cmatrix
  ];
}
