{ pkgs, username, stateVersion, ... }: {
  imports = [
    ./home-manager.nix # DO NOT REMOVE
    ./fastfetch.nix
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
    (discord.override { withVencord = true; })
    prismlauncher
    openjdk # bundle with prismlauncher :)
    spotify
    keepassxc
    vlc
    ghostty
  ];
}
