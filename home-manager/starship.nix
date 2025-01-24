{ username, ... }: {
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };
  programs.fish.interactiveShellInit = "set fish_greeting # Disable greeting & starship init fish | source";

  imports = [
    ./${username}/starship-config.nix
  ];
}
