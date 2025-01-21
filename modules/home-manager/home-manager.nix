{ username, stateVersion, ... }: {

  home.username = "${username}";
  home.homeDirectory = "/home/${username}";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
  home.stateVersion = "${stateVersion}";
}
