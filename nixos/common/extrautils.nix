{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # These packages remain UNCONFIGURED - if needed, separate into modules and configure.
    git
    wget

    # Pull progs. out and make individual modules when programs gain home-manager configs
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
    unstable.logseq
  ];

  # Install apps
  programs.firefox.enable = true;
}
