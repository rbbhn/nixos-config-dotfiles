{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    #DO NOT MOVE TO USER ZONE
    gd # "gdown" - wget for google drive links
    progress # "progress - for fetching status of loooong commands
    wget



    #Move to user zone
    git
    openjdk # java >:(
    lazygit # "lg" - terminal UI for git
    ranger # "ranger" - tui file manager
    gh # github command line

    kdePackages.kate
    (discord.override { withVencord = true; })
    prismlauncher
    spotify
    keepassxc
    vlc
    ghostty
  ];
}
