{ username, ... }: {
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };
  programs.fish.shellInit = "starship init fish | source";

  imports = [
    ./${username}/starship-config.nix
  ];
}
