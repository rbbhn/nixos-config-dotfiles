{ pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    #DO NOT MOVE TO USER ZONE
    fastfetch
    gd # "gdown" - wget for google drive links
    progress # "progress - for fetching status of loooong commands
    wget



    #Move to user zone
    git
    openjdk # java >:(
    fzf # "fzf" - command line fuzzy finder & search utility
    ripgrep # "rg" - faster, configurable grep
    zoxide # "z" and "zi" - faster, configurable cd w/ teleportation (interactive = "zi")
    bat # "bat" - faster, configurable cat
    eza # "eza" - faster, configurable ls
    tldr # "tldr" - manpages, summarized
    lazygit # "lg" - terminal UI for git
    ranger # "ranger" - tui file manager
    gh # github command line

    kdePackages.kate
    (discord.override { withVencord = true; withOpenASAR = true; })
    prismlauncher
    spotify
    keepassxc
    vlc
    inputs.ghostty.packages.x86_64-linux.default
  ];

  #move to user zone
  programs.fish.interactiveShellInit = "zoxide init fish | source"; # enable zoxide in fish
}
