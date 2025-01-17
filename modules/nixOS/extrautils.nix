{  pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    #DO NOT MOVE TO USER ZONE
    fastfetch
    gd # "gdown" - wget for google drive links
    progress # "progress - for fetching status of loooong commands
    wget

    #Move to user zone
    git
    openjdk # java >:(
    fzf # "fzf" - command line fuzzy finder. ess: interactive grep
    ripgrep # "rg" - faster, configurable grep
    zoxide # "z" - faster, configurable cd w/ teleportation
    bat # "bat" - faster, configurable cat
    eza # "eza" - faster, configurable ls
  ];

  #move to user zone
  programs.fish.interactiveShellInit = "zoxide init fish | source"; # enable zoxide in fish
  programs.fish.shellAliases = {
    ls = "eza -la --octal-permissions --git";
    cat = "bat";
    grep = "rg";
    fzf = "fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'";
  };
}
