{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # These packages remain UNCONFIGURED - if needed, separate into modules and configure.
    git
    wget

    # This is the big todo - these progs. should NOT be in this place.
    # TUI
    progress
    lazygit
    ranger
    gh
    glow

    # GUI
    kdePackages.kate
    spotify
    keepassxc
    vlc
    ghostty
    vesktop
    audacity
    obs-studio
  ];

  programs.firefox.enable = false;
}