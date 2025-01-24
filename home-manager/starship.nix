{ username, ... }: {
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };
  programs.fish.interactiveShellInit = "echo KYS";

  imports = [
    ./${username}/starship-config.nix
  ];
}
