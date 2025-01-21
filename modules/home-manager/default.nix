{ username, stateVersion, ... }: {
  imports = [
    ./${username}.nix # Import user-specific modules

    ./fastfetch.nix
    ./home-manager.nix
    ./stylix.nix
  ];

  home.packages = with pkgs; [
    pipes
    cmatrix
  ];
}
