{ username, stateVersion, ... }: {
  imports = [
    ./${username}.nix # Import user-specific modules

    ./fastfetch.nix
    ./stylix.nix
  ];

  home.packages = with pkgs; [
    pipes
    cmatrix
  ];
}
