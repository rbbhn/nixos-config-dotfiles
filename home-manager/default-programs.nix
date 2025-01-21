{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Pull progs. out and make individual modules when programs gain home-manager configs
    # TUI
    fastfetch
    progress
    lazygit
    ranger
    gh

    # GUI
    kdePackages.kate
    spotify
    keepassxc
    vlc
    ghostty
  ];

  # Install apps
  programs.firefox.enable = true;
}
