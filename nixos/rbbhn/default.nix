{ ... }: {
  imports = [
    # Fill in later
  ];

  # DEFAULTS... MOVE TO MODULES EVENTUALLY
  environment.systemPackages = with pkgs; [
    # Pull progs. out and make individual modules when programs gain home-manager configs
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
  ];

  # Install apps
  programs.firefox.enable = true;
}