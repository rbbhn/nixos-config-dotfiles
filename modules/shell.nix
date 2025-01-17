{ pkgs, ... }: {
  programs.fish = {
    enable = true;
    interactiveShellInit = "set fish_greeting # Disable greeting";
  };
  users.defaultUserShell = pkgs.fish; # set fish as default shell
}
