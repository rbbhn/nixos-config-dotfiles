{ pkgs, username, ... }: {
  imports = [
    ./${username}.nix # Import user specific modules. Done this way so that username.nix can import modules that are the same between users that not all users have, and /username/default.nix can import modules that are unique to each user.

    ./discord.nix
    ./home-manager.nix # DO NOT REMOVE
    ./fastfetch.nix
    ./minecraft.nix
    ./stylix.nix
  ];

  home.packages = with pkgs; [
    # CONFIGURED WITH HOME MANAGER, NOT INSTALLED BY HOME MANAGER
    # git
    # wget

    # neovim, eventually
    progress
    lazygit # "lg" - terminal UI for git
    ranger # "ranger" - tui file manager
    gh # github command line

    kdePackages.kate
    spotify
    keepassxc
    vlc
    ghostty
  ];
}
