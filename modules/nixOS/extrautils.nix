{  pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    git
    wget
    openjdk # java >:(
    fastfetch
    gd # "gdown" - wget for google drive links
    progress # "progress - for fetching status of loooong commands
    fzf # "fzf" - command line fuzzy finder. ess: interactive grep
    ripgrep # "ripgrep" - faster, configurable grep clone
    zoxide
  ];
}
