{ pkgs, ... }: {
  programs.fish.enable = true;
  programs.fish.interactiveShellInit = "set fish_greeting # Disable greeting";
  users.defaultUserShell = pkgs.fish; # set fish as default shell
}
