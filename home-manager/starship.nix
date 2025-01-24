{ username, ... }: {
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };
  programs.fish.interactiveShellInit = "starship init fish | source";

  imports = [
    ./${username}/starship-config.nix
  ];
}
